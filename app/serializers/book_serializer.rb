class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :isbn, :cover
  belongs_to :publisher
  has_many :authors
end
