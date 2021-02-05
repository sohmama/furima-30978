require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item)
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

    it 'category_idが1では登録できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end

    it 'condition_idが空では登録できない' do
      @item.condition_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition is not a number")
    end

    it 'condition_idが1では登録できない' do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition must be other than 1")
    end

    it 'delivery_cost_idが空では登録できない' do
      @item.delivery_cost_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery cost is not a number")
    end

    it 'delivery_cost_idが1では登録できない' do
      @item.delivery_cost_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery cost must be other than 1")
    end

    it 'prefecture_idが空では登録できない' do
      @item.prefecture_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture is not a number")
    end

    it 'prefecture_idが1では登録できない' do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
    end

    it 'delivery_days_idが空では登録できない' do
      @item.delivery_days_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery days is not a number")
    end

    it 'delivery_days_idが1では登録できない' do
      @item.delivery_days_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery days must be other than 1")
    end

    it 'priceが空では登録できない' do
      @item.price = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it 'priceが¥299では登録できない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end

    it 'priceが¥10,000,000では登録できない' do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end

    it 'priceが全角文字では登録できない' do
      @item.price = /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end

    it 'priceが半角英数混合では登録できない' do
      @item.price = /\A[a-z0-9]+\z/
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end

    it 'priceが半角英語では登録できない' do
      @item.price = /\A[a-z]+\z/
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end

    it 'ユーザーが紐づいていなければ投稿でいない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("User must exist")
    end

   end
  end
end