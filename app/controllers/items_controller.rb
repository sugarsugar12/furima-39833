class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, except: [:index, :new,:create,:show,:update,:destroy]


  def index
    @items=Item.all.order(created_at: :desc)
    #allがなくても可
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

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
       redirect_to item_path(@item.id)
       #詳細ページ
    else
       render :edit, status: :unprocessable_entity
    end
  end

 private
  def item_params
    params.require(:item).permit(:title,:explanation,:category_id,:quality_id,:delivery_charge_id,:source_id,:number_of_day_id,:price,:image).merge(user_id: current_user.id)
  end

  def move_to_index
    @item = Item.find(params[:id])
    unless user_signed_in? && current_user.id == @item.user_id
      redirect_to action: :index
    end
  end
end
