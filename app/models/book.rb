class Book < ApplicationRecord
	validates :caption, length: { maximum: 200 }

	belongs_to :user

end
