class ReviewSerializer < ActiveModel::Serializer
    attributes :id, :date_time, :note, :user_id, :bakery_id
    
    
    # has_one :user
    # has_one :bakery
  
  end