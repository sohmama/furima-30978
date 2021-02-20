class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :login_user

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
       pay_item
       @user_purchase.save
       redirect_to root_path
    else
       render action: :index
    end
  end

  private
  def purchase_params
    params.require(:user_purchase).permit(:postal_code, :prefecture_id, :municipality, :address, :building, :tel).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,  
        card: purchase_params[:token],   
        currency: 'jpy'                
      )
  end

  def login_user
    @item = Item.find(params[:item_id])
    if current_user == @item.user || @item.item_purchase.present?
    redirect_to root_path
    end
  end

end
