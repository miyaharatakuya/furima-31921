class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]

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

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    redirect_to action: :index unless @item.user_id == current_user.id
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :text, :condition_id, :price, :category_id, :postage_id, :sipping_area_id,
                                 :sipping_date_id).merge(user_id: current_user.id)
  end
end
