class Student < ActiveRecord::Base
  belongs_to :school
  before_create :confirmation_token
  has_many :books
  has_many :transactions, foreign_key: :seller_id, dependent: :destroy
  has_many :buyers, through: :transactions
  accepts_nested_attributes_for :books,
                                :reject_if => :all_blank,
                                :allow_destroy => true

  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true

  def has_sold?(buyer)
    buyers.include? buyer
  end

  private
  def confirmation_token
      if self.confirm_token.blank?
          self.confirm_token = SecureRandom.urlsafe_base64.to_s
      end
    end
end
