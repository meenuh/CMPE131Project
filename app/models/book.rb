class Book < ActiveRecord::Base
  belongs_to :student
  belongs_to :school
  has_many :transactions, foreign_key: :book_id
end
