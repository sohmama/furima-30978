class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit ]
  before_action :item_find, except: [:index, :new, :create]
  before_action :redirect_root, only: [:edit, :update, :destroy]

  def index
    @items = Item.all.order(id: "DESC")
  end

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

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to show
    else 
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :introduction, :category_id, :condition_id, :delivery_cost_id, :prefecture_id, :delivery_days_id, :price).merge(user_id: current_user.id)
  end

  def item_find
    @item = Item.find(params[:id])
  end

  def redirect_root
    unless current_user.id == @item.user_id
      redirect_to root_path
    end
  end

end
