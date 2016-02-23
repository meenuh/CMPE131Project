class Book < ActiveRecord::Base
  belongs_to :student
  belongs_to :school
end
