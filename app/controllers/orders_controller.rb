class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item

  def index
    @user_order = UserOrder.new
    redirect_to root_path if current_user == @item.user || !@item.buyer_id.nil?
  end

  def create
    @user_order = UserOrder.new(order_params)
    if @user_order.valid?
      pay_item
      @user_order.save
      @item.update(buyer_id: current_user.id)
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:user_order).permit(:post_code, :prefecture_id, :city, :address, :building, :phone).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
