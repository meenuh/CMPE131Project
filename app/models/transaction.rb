class Transaction < ActiveRecord::Base
  belongs_to :buyer, class_name: 'Student'
  belongs_to :seller, class_name: 'Student'
  belongs_to :book, class_name: 'Book'

  validates :price, presence: true 
end
