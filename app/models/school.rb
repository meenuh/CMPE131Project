class School < ActiveRecord::Base
	validates :name, :presence => true
	validates :no_of_students, :presence => true
	
	has_many :student
end
