class AddCardTokenToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :card_token, :string
  end
end
