class Book < ActiveRecord::Base
  belongs_to :student
  belongs_to :school
  has_many :transactions, foreign_key: :book_id

  private

  def addUrl

      if self.url.blank?
        self.url = "http://covers.openlibrary.org/b/isbn/" + self.isbn + "-M.jpg"
      end
  
  end
end
