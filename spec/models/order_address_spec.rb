require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '購入の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)

      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    end

    context '購入できる場合' do
      it '情報が全てあれば購入できる' do
        expect(@order_address).to be_valid
      end

      it 'buildingは空でも購入できる' do
        @order_address.building = ''
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
          @order_address.prefecture_id = 1
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
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
    end
  end
end
