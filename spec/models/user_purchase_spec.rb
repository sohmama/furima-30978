require 'rails_helper'

RSpec.describe UserPurchase, type: :model do
  before do
    @user_purchase = FactoryBot.build(:user_purchase)
  end

  describe '#create' do
    context '商品購入ができる場合' do
      it 'postal_code, prefecture_id, municipality, address, telがあれば商品購入できること' do
        expect(@user_purchase).to be_valid
      end

      it 'buildingは空でも商品購入できること' do
        @user_purchase.building = ''
        expect(@user_purchase).to be_valid
      end
    end

    context '商品購入ができない場合' do
      it 'postal_codeが空では購入できない' do
        @user_purchase.postal_code = ""
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeにはハイフンが必要であること' do
        @user_purchase.postal_code = "1234567"
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Postal code Input correctly")
      end
  
      it 'prefecture_idが空では登録できない' do
        @user_purchase.prefecture_id = ""
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'municipalityが空では登録できない' do
        @user_purchase.municipality = ""
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Municipality can't be blank")
      end

      it 'addressが空では登録できない' do
        @user_purchase.address = ""
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Address can't be blank")
      end

      it 'telが空では登録できない' do
        @user_purchase.tel = ""
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Tel can't be blank")
      end

      it 'telにはハイフンが不要であること' do
        @user_purchase.tel = "090-1234-5678"
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Tel Input only number")
      end

      it 'telは半角数字である必要があること' do
        @user_purchase.tel = "〇九〇一二三四五六七八"
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Tel Input only number")
      end
    end  
  end

end
