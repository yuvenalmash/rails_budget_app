class CreateJoinTableExpensesCategories < ActiveRecord::Migration[7.0]
  def change
    create_join_table :expenses, :categories do |t|
      t.index %i[expense_id category_id], unique: true
    end
  end
end
