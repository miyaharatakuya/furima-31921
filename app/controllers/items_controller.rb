class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

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

  def index
    @items = Item.all.order('created_at DESC')
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :text, :condition_id, :price, :category_id, :postage_id, :sipping_area_id,
                                 :sipping_date_id).merge(user_id: current_user.id)
  end
end
