class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :charge
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :days

  validates :category_id,   numericality: { other_than: 1 }
  validates :status_id,     numericality: { other_than: 1 }
  validates :charge_id,     numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :days_id,       numericality: { other_than: 1 }
end
