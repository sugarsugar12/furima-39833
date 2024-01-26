class DestinationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  before_action :prevent_url

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @destination_buy = DestinationBuy.new
    if current_user == @item.user
       redirect_to root_path
      end
  end
  
  def create
    @destination_buy = DestinationBuy.new(order_params)
    
     if @destination_buy.valid?
      pay_item
        @destination_buy.save
        redirect_to root_path
     else
         gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
         render :index, status: :unprocessable_entity
     end
  end
  
  private
    def order_params
    params.require(:destination_buy).permit(:post_code, :prefecture_id, :city, :street_address, :building_name, :telephone_number).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
    end

    def set_item
       @item = Item.find(params[:item_id])
      
    end

    def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
      Payjp::Charge.create(
        amount: @item.price,  
        card: order_params[:token],    
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
    end

    def prevent_url
      if current_user && @item.user_id != current_user.id && @item.buy.present?
         redirect_to root_path
      end
    end
    
end
