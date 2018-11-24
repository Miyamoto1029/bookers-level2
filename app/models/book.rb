class Book < ApplicationRecord
	validates :book_name, presence: true
	validates :caption, presence: true
	validates :caption, length: { maximum: 200 }
	
	belongs_to :user

end
