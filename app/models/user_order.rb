class UserOrder
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :address, :building, :phone, :token, :user_id, :item_id

  with_options presence: true do
    validates :token
    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "Input correctly" }
    validates :city
    validates :address
    validates :phone, format: { with: /\A\d{10}\z|\A\d{11}\z/, message: "Input only number" }
  end

  validates :prefecture_id, numericality: { other_than: 1, message: "Select" }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone: phone, order_id: order.id)
  end
end
