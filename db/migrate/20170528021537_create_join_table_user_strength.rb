class CreateJoinTableUserStrength < ActiveRecord::Migration[5.1]
  def change
    create_join_table :users, :strengths do |t|
      # t.index [:user_id, :strength_id]
      # t.index [:strength_id, :user_id]
    end
  end
end
