class Author < ActiveRecord::Base
  has_many :publications
  has_many :books, through: :publications

  validates :name, presence: true, uniqueness: true, length: { minimum: 5 }
end
