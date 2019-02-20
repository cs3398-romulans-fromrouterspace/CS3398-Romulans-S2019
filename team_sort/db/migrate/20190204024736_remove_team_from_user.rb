class RemoveTeamFromUser < ActiveRecord::Migration[5.1]
  def change
    remove_reference :users, :team, foreign_key: true
  end
end
