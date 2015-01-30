class ListsController < ApplicationController
  
  before_action :authenticate_user! # users must be signed in before any lists_controller method
  
  
  def index
  end

  def show
    @list = current_user.list
  end

  def new
  end

  def edit
  end
  
  
  
end
