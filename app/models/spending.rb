class Spending < ApplicationRecord
    belongs_to :user
    has_many :links, dependent: :destroy
    has_many :categories, through: :links

    validates :name, presence: true
    validates :amount, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
