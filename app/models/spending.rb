class Spending < ApplicationRecord
    belongs_to :user
    has_many :links, dependent: :destroy
    has_many :categories, through: :links
end
