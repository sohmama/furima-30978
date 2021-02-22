class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create ]


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

  private

  def item_params
    params.require(:item).permit(:image, :name, :introduction, :category_id, :condition_id, :delivery_cost_id, :prefecture_id, :delivery_days_id, :price).merge(user_id: current_user.id)
  end

end
