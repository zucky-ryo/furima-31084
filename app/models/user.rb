class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders

  NAME_REGEX = { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'Full-width characters' }.freeze
  NAME_KANA_REGEX = { with: /\A[ァ-ン]+\z/, message: 'Full-width katakana characters' }.freeze

  validates :nickname,    presence: true
  validates :family_name, presence: true, format: NAME_REGEX
  validates :first_name,  presence: true, format: NAME_REGEX
  validates :family_kana, presence: true, format: NAME_KANA_REGEX
  validates :first_kana,  presence: true, format: NAME_KANA_REGEX
  validates :birthday,    presence: true

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'Include both letters and numbers'
end
