class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :isbn, :cover
  attribute :publisher
end
