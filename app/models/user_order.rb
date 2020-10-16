class UserOrder
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :address, :building, :phone, :token, :user_id, :item_id

  

  with_options presence: true do
    validates :post_code
    validates :city
    validates :address
    validates :phone
    validates :token
  end

  validates :prefecture_id, numericality: { other_than: 1 }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone: phone, order_id: order.id)
  end
end