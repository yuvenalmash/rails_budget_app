class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable
  has_many :expenses, foreign_key: :author_id, dependent: :destroy
  has_many :category_expenses, through: :expenses
  has_many :categories, -> { distinct }, through: :category_expenses

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true, length: { minimum: 6 }

  def admin?
    role == "admin"
  end
end
