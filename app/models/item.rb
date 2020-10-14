class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :charge
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :days

  validates :image,      presence: true
  validates :name,       presence: true
  validates :text,       presence: true
  validates :category,   presence: true
  validates :status,     presence: true
  validates :charge,     presence: true
  validates :prefecture, presence: true
  validates :days,       presence: true
  validates :price,      presence: true

  validates :category_id,   numericality: { other_than: 1 }
  validates :status_id,     numericality: { other_than: 1 }
  validates :charge_id,     numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :days_id,       numericality: { other_than: 1 }
end
