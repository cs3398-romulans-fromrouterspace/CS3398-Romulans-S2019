class TeamsController < ApplicationController
  def index
    group = Group.find(params[:group])
    @teams = group.teams
  end

  def new
    @team = Team.new
  end

  private

    def team_params
      params.require(:team).permit(:score)
    end
end
