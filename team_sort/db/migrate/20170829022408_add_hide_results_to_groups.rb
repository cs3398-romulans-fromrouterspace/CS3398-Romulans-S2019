class AddHideResultsToGroups < ActiveRecord::Migration[5.1]
  def change
    add_column :groups, :hide_results, :boolean
  end
end
