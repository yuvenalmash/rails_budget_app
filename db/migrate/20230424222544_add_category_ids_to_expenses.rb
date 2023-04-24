class AddCategoryIdsToExpenses < ActiveRecord::Migration[7.0]
  def change
    add_column :expenses, :category_ids, :integer, array: true, default: []
  end
end
