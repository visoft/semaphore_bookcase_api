class Book < ActiveRecord::Base
  belongs_to :publisher
  has_many :publications
  has_many :authors, through: :publications

  validates :title, presence: true, length: { minimum: 5 }
  validates :isbn, presence: true, uniqueness: true, length: { minimum: 10 }
  validates :publisher, presence: true
end
