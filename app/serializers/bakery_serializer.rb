class BakerySerializer < ActiveModel::Serializer
    attributes :id, :name, :item, :image
  end
  