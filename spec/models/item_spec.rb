require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item)
    # @item.image = FactoryBot.build(:item)
  end

  describe '商品出品' do
  context '商品出品ができる場合' do
    it 'image, name, introduction, category, condition, delivery_cost, prefecture, delivery_days, priceがあれば商品出品できること' do
    expect(@item).to be_valid
    end
  end

   context '商品出品ができない場合' do
    it 'imageが添付されていないと登録できない' do
     @item.image = nil
     @item.valid?
     expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it 'nameが空では登録できない' do
      @item.name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it 'category_idが空では登録できない' do
      @item.category_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Category is not a number")
    end

    it 'condition_idが空では登録できない' do
      @item.condition_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition is not a number")
    end

    it 'delivery_cost_idが空では登録できない' do
      @item.delivery_cost_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery cost is not a number")
    end

    it 'prefecture_idが空では登録できない' do
      @item.prefecture_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture is not a number")
    end

    it 'delivery_days_idが空では登録できない' do
      @item.delivery_days_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery days is not a number")
    end

    it 'priceが空では登録できない' do
      @item.price = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it 'ユーザーが紐づいていなければ投稿でいない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("User must exist")
    end
   end
  end
end