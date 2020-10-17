require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  describe '商品購入機能' do
    before do
      @order = FactoryBot.build(:user_order)
    end

    context '購入がうまく行く時' do
      it 'token, post_code, prefecture_id, city, address, phoneが存在するとき購入できる' do
        expect(@order).to be_valid
      end
      it '郵便番号が数字（3文字 - 4文字）の形の時購入できる' do
        @order.post_code = '222-2222'
        expect(@order).to be_valid
      end
      it '電話番号がハイフンなし11桁以内の時購入できる' do
        @order.phone = '12345678910'
        expect(@order).to be_valid
      end
    end

    context '購入が失敗する時' do
      it 'tokenが空の時購入できない' do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
      it 'post_codeが空の時購入できない' do
        @order.post_code = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeがハイフンを含まない時購入できない' do
        @order.post_code = '1111111'
        @order.valid?
        expect(@order.errors.full_messages).to include('Post code Input correctly')
      end
      it 'post_codeがハイフンを含んでも半角数字でない時購入できない' do
        @order.post_code = '１１１-１１１１'
        @order.valid?
        expect(@order.errors.full_messages).to include('Post code Input correctly')
      end
      it 'prefecture_idが空の時購入できない' do
        @order.prefecture_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include('Prefecture Select')
      end
      it 'prefecture_idが1の時購入できない' do
        @order.prefecture_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include('Prefecture Select')
      end
      it 'cityが空の時購入できない' do
        @order.city = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空の時購入できない' do
        @order.address = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Address can't be blank")
      end
      it 'phoneが空の時購入できない' do
        @order.phone = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone can't be blank")
      end
      it 'phoneが10文字か11文字でない時購入できない' do
        @order.phone = '090123456'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone Input only number')
      end
      it 'phoneが半角数字でない時購入できない' do
        @order.phone = '０９０１２３４５６７８'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone Input only number')
      end
    end
  end
end
