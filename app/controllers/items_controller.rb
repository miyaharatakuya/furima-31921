class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :item_find, only: [:show, :edit, :update, :destroy]
  before_action :item_redirect, only: [:edit, :update, :destroy]

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
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
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
    params.require(:item).permit(:image, :name, :text, :condition_id, :price, :category_id, :postage_id, :sipping_area_id,
                                 :sipping_date_id).merge(user_id: current_user.id)
  end

  def item_find
    @item = Item.find(params[:id])
  end

  def item_redirect
    redirect_to action: :index unless @item.user_id == current_user.id
  end
end
