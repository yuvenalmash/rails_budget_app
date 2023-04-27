class Category < ApplicationRecord
  has_many :category_expenses
  has_many :expenses, through: :category_expenses

  validates :name, presence: true, length: { minimum: 1, maximum: 20 }
  validates :icon, presence: true

  def total_expenses
    expenses.sum(:amount)
  end
end
