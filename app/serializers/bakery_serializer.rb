class BakerySerializer < ActiveModel::Serializer
    attributes :id, :name, :item, :image
    has_many :users, through: :reviews
  end
  