class ItemsController < ApplicationController
  def index
    
  end

  def show
    @list = current_user.lists.find(params[:list_id])
    @item = @list.items.find(params[:id])
  end

  def new
    @list = current_user.lists.find(params[:list_id])
    @item = Item.new
  end

  def edit
  end
end
