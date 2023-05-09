require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '購入の保存' do
    before do
      user = FactoryBot.create(:user)
      @donation_address = FactoryBot.build(:donation_address, user_id: user.id)
    end

    context '購入できる場合' do
      it '情報が全てあれば購入できる' do
        expect(@order_address).to be_valid
      end
      it 'buildingは空でも購入できる' do
        @order_address.street = ''
        expect(@order_address).to be_valid
      end
    end

    context '購入できない場合' do
      it 'postal_codeが空だと購入できない' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと購入できない' do
        @order_address.postal_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'prefectureを選択していないと購入できない' do
        @order_address.prefecture = 0
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'priceが空だと購入できない' do
        @order_address.price = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Price can't be blank")
      end
      it 'cityが空では購入できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it 'phoneが空では購入できない' do
        @order_address.phone = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone can't be blank")
      end
      it 'phoneは10桁以上11桁以内の半角数値のみの入力でなければ購入できない' do
        @order_address.phone = '090123456'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone is invalid. Input only number')
        @order_address.phone = '090-1234-56'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone is invalid. Input only number')
        @order_address.phone = '０９０１２３４５６７８'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone is invalid. Input only number')

      end
      it 'userが紐付いていないと購入できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'クレジッカード情報が空では購入できない' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it "priceが空では保存ができないこと" do
        @order.price = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Price can't be blank")
      end

    end
  end
end
