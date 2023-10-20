class Category < ApplicationRecord
    belongs_to :user
    has_many :links, dependent: :destroy
    has_many :spendings, through: :links

    validates :name, presence: true
    validates :icon, presence: true
end
