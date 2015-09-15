class Publication < ActiveRecord::Base
  belongs_to :book
  belongs_to :author

  validates :book, presence: true
  validates :author, presence: true
end
