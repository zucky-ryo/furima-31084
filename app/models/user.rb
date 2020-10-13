class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,    presence: true
  validates :family_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'Full-width characters' }
  validates :first_name,  presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'Full-width characters' }
  validates :family_kana, presence: true, format: { with: /\A[ァ-ン]+\z/, message: 'Full-width katakana characters' }
  validates :first_kana,  presence: true, format: { with: /\A[ァ-ン]+\z/, message: 'Full-width katakana characters' }
  validates :birthday,    presence: true

end
