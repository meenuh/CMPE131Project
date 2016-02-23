class Student < ActiveRecord::Base
  belongs_to :school

  has_many :books
  accepts_nested_attributes_for :books,
                                :reject_if => :all_blank,
                                :allow_destroy => true

  has_secure_password

  validates :email, presence: true, uniqueness: true
end
