class Category < ApplicationRecord
  has_many :category_expenses
  has_many :expenses, through: :category_expenses

  validates :name, presence: true, length: { minimum: 1, maximum: 20 }
  validates :icon, presence: true

  ICONS = [
    'fa-solid fa-utensils',
    'fa-solid fa-tshirt',
    'fa-solid fa-gas-pump',
    'fa-solid fa-shopping-cart',
    'fa-solid fa-credit-card',
    'fa-solid fa-bus',
    'fa-solid fa-subway',
    'fa-solid fa-train',
    'fa-solid fa-bolt',
    'fa-solid fa-water',
    'fa-solid fa-heartbeat',
    'fa-solid fa-gamepad',
    'fa-solid fa-question',
    'fa-solid fa-bowling-ball',
    'fa-solid fa-band-aid'
  ].freeze

  def total_expenses
    expenses.sum(:amount)
  end

  def category_expenses(current_user)
    expenses
      .where.not(name: "dummy-expense-#{current_user.id}")
      .order(created_at: :desc)
  end
end
