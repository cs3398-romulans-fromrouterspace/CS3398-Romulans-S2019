class AddStripCardTokenToGroup < ActiveRecord::Migration[5.1]
  def change
    add_column :groups, :card_token, :string
  end
end
