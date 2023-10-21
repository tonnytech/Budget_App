class Spending < ApplicationRecord
  belongs_to :user
  has_many :links, dependent: :destroy
  has_many :categories, through: :links

  validates :name, presence: true
  validates :amount, presence: true
end
