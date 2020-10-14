class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :charge
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :day

  validates :image,      presence: true
  validates :name,       presence: true
  validates :text,       presence: true
  validates :category,   presence: true
  validates :status,     presence: true
  validates :charge,     presence: true
  validates :prefecture, presence: true
  validates :day,        presence: true
  validates :price,      presence: true, numericality: { greater_than_or_equal_to: 300, less_than: 10_000_000 }

  validates :category_id,   numericality: { other_than: 1 }
  validates :status_id,     numericality: { other_than: 1 }
  validates :charge_id,     numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :day_id,        numericality: { other_than: 1 }
end
