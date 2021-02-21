class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create ]

  # 商品一覧機能
  # def index
  #   @items = Item.all
  # end

  def new
    @item = Item.new
  end

  def create
   @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  # 商品詳細機能
  # def show
  #   @item = Item.find(params[:id])
  # end

  # 商品編集機能
  # def edit
  #   @item = Item.find(params[:id])
  # end

  # def update
  #   item = Item.find(params[:id])
  #   item.update(item_params)
  # end

  # 商品削除機能
  # def destroy
  #   item = Item.find(params[:id])
  #   item.destroy
  #   redirect_to root_path
  # end

  private

  def item_params
    params.require(:item).permit(:image, :name, :introduction, :category_id, :condition_id, :delivery_cost_id, :prefecture_id, :delivery_days_id, :price).merge(user_id: current_user.id)
  end

end
