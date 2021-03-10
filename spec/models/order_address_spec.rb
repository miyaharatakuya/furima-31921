require 'rails_helper'


RSpec.describe OrderAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: @user.id, item_id: @item.id)
  end

  describe '購入機能' do
    context '購入成功時' do
      it '全ての項目が正しく入力されていれば購入できる' do
        expect(@order_address).to be_valid
      end
    end
    context '購入失敗時' do
      it 'postal_codeが空だと登録できない' do
        @order_address.postal_code = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'sipping_area_idが0だと登録できない' do
        @order_address.sipping_area_id = 0
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Sipping area must be other than 0')
      end
      it 'cityが空だと登録できない' do
        @order_address.city =  ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberが空だと登録できない' do
        @order_address.house_number =  ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House number can't be blank")
      end
      it 'phone_numberが空だと登録できない' do
        @order_address.phone_number =  ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'postal_codeにハイフンが含まれないと登録できない' do
        @order_address.postal_code =  '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid")
      end
      it 'postal_codeが全角数字だと登録できない' do
        @order_address.postal_code = '１２３-４５６７'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code is invalid')
      end
      it 'クレジットカード情報が正しく入力されていないと登録できない' do
        @order_address.token =  nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end