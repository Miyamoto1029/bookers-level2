class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :username, presence: true #uniquenessから変更
  validates :email, presence: true #ここを追加した
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def email_required?
  	false
  end
  def email_changed?
  	false
  end

  has_many :books, dependent: :destroy

  attachment :profile_image

end
