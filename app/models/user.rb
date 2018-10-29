class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, presence: true #uniquenessから変更
  validates :username,    length: { minimum: 2 }
  validates :username,    length: { maximum: 20 }
  validates :introduction, length: { maximum: 50 }
  has_many :books, dependent: :destroy

  attachment :profile_image

end
