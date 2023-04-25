class Category < ApplicationRecord
  has_many :expenses

  validates :name, presence: true, length: { minimum: 1, maximum: 20 }
  validates :icon, presence: true
end
