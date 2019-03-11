class GroupsController < ApplicationController
  def index
    @user = current_user
    @groups = @user.groups
    @teams = @user.teams
    @group = Group.new
  end

  def show
    @group = Group.find(params[:id])
  end

  def new
    @group = Group.new
  end

  def edit
    @group = Group.find(params[:id])
  end

  CHARS = ('0'..'9').to_a + ('A'..'Z').to_a + ('a'..'z').to_a
  def random_password(length=10)
    CHARS.sort_by { rand }.join[0...length]
  end

  def create
    create_params = group_params
    # generate random string for group code
    create_params[:code] = random_password(8);

    #SecureRandom.base64(5) is old generator
    @group = Group.new(create_params)
    @group.users << current_user

    if @group.save
      redirect_to groups_path
    else
      render 'new'
    end
  end

  def update
    @group = Group.find(params[:id])

    if @group.update(group_params)
      redirect_to root_url
    else
      render 'edit'
    end
  end

  def destroy
    @group = Group.find(params[:id])

    teams = @group.teams
    teams.each do |team|
      team.users.each do |user|
        user.teams.delete(team)
        user.save
      end
    end
    teams.destroy_all
    @group.destroy

    redirect_to groups_path
  end

  def generate_teams
    @group = Group.find(params[:id])
  end

  def run_sort
    @group = Group.find(params[:id])
    byebug
    users = @group.users.where(admin: false)

    # remove the user from their team for this group in case we're doing a re-sort
    users.each do |user|
      team = user.teams.where(group_id: @group.id)
      user.teams.delete(team)
      user.save
    end

    team_size = group_params[:team_size].to_i
    user_count = users.count

    # if we're doing a re-sort we'll need to get rid of teams that were previously formed
    @group.teams.destroy_all

    # create teams
    team_num = user_count/team_size
    team_num.times do
      team = Team.new(score: 0)
      team.save
      @group.teams << team
    end


    ## STRATEGIC ##
    strategic = find_strength(users, 'strategic thinking')
    users = users - strategic

    teams = @group.teams.order(:score)
    teams.each do |team|
      if strategic.any?
        index = find_user_for_team(team.users, strategic)
        team.users << strategic[index]
        team.score += 1
        team.save
        strategic.delete_at(index)
      end
    end

    # put any we didn't assign to a team back into users
    strategic.each do |s|
      users << s
    end

    ## EXECUTORS ##
    executors = find_strength(users, 'executing')
    users = users - executors

    teams = @group.teams.order(:score)
    teams.each do |team|
      if executors.any?
        index = find_user_for_team(team.users, executors)
        team.users << executors[index]
        team.score += 1
        team.save
        executors.delete_at(index)
      end
    end

    # put any we didn't assign to a team back into users
    executors.each do |e|
      users << e
    end

    ## INFLUENCERS ##
    influencers = find_strength(users, 'influencing')
    users = users - influencers

    teams = @group.teams.order(:score)
    teams.each do |team|
      if influencers.any?
        index = find_user_for_team(team.users, influencers)
        team.users << influencers[index]
        team.score += 1
        team.save
        influencers.delete_at(index)
      end
    end

    # put any we didn't assign to a team back into users
    influencers.each do |i|
      users << i
    end

    ## RELATIONSHIP BUILDERS ##
    relationship_builders = find_strength(users, 'relationship building')
    users = users - relationship_builders

    teams = @group.teams.order(:score)
    teams.each do |team|
      if relationship_builders.any?
        index = find_user_for_team(team.users, relationship_builders)
        team.users << relationship_builders[index]
        team.score += 1
        team.save
        relationship_builders.delete_at(index)
      end
    end

    # put any we didn't assign to a team back into users
    relationship_builders.each do |rb|
      users << rb
    end

    teams = @group.teams.order(:score)

    # add people to teams so team size is met
    teams.each do |team|
      while team.users.count < team_size
        index = find_user_for_team(team.users, users)
        team.users << users[index]
        team.save
        users.delete_at(index)
      end
    end

    # add extra people to teams with the lowest scores
    index = 0
    while users.any?
      team = teams[index]
      user_index = find_user_for_team(team.users, users)
      team.users << users[user_index]
      team.save
      users.delete_at(user_index)
      index += 1
      if index >= team_num
        index = 0
      end
    end

    redirect_to teams_path(group: @group)
  end

  private

    def group_params
      params.require(:group).permit(:title, :team_size, :hide_results)
    end

    def find_strength(users, strength)
      found = []
      count = 0
      users.each do |user|
        strengths = user.strengths
        strengths.each do |s|
          if s.domain == strength
            count += 1
          end
        end
        if count >= 2
          found << user
        end
        count = 0
      end
      found
    end

    def find_user_for_team(team_users, users)
      team_strengths = []
      team_users.each do |user|
        user.strengths.each do |s|
          team_strengths << s.name
        end
      end

      # keep track of the max diff count and the index of the user with them
      diff_count = 0
      user_index = 0
      result = user_index
      users.each do |user|
        diffs = 0
        user.strengths.each do |s|
          if not team_strengths.include?(s.name)
            diffs += 1
          end
        end

        if diffs > diff_count
          diff_count = diffs
          result = user_index
        end
        user_index += 0
      end
      result
    end

end
