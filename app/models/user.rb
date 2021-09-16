class User < ApplicationRecord
    has_many :reviews
    has_many :bakeries, through: :reviews
  end
  
