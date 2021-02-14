class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @user_purchase = UserPurchase.new
  end

  def new
    @user_purchase = UserPurchase.new
  end

  def create
    @user_purchase = UserPurchase.new(purchase_params)
    @item = Item.find(params[:item_id])
    if @user_purchase.valid? 
       @user_purchase.save
       redirect_to root_path
    else
       render action: :index
    end
  end

  private
  def purchase_params
    params.permit(:postal_code, :prefecture_id, :municipality, :address, :building, :tel).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
