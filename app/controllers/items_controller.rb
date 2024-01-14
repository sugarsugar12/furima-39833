class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
  end

  def new
    @item=Item.new
  end

  def create
    @item=Item.new(item_params)
     if @item.save
        redirect_to '/'
     else
       render :new, status: :unprocessable_entity
     end
  end

 private
  def item_params
    params.require(:item).permit(:title,:explanation,:category_id,:quality_id,:delivery_charge_id,:source_id,:number_of_day_id,:price,:image).merge(user_id: current_user.id)
  end
end
