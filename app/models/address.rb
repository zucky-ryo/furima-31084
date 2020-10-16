class Address < ApplicationRecord
  belongs_to :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  with_options presence: true do
    validates :post_code
    validates :prefecture
    validates :city
    validates :address
    validates :phone
  end

  validates :prefecture_id, numericality: { other_than: 1 }
end
