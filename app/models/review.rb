class Review < ApplicationRecord
    belongs_to :user
    belongs_to :bakery
    # has_many :bakeries
    # has_many :users
end
