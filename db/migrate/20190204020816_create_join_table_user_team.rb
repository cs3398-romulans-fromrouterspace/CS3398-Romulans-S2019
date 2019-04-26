class CreateJoinTableUserTeam < ActiveRecord::Migration[5.1]
  def change
    create_join_table :users, :teams do |t|
      # t.index [:user_id, :strength_id]
      # t.index [:strength_id, :user_id]
    end
  end
end
