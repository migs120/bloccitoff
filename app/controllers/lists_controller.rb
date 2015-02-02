class ListsController < ApplicationController
  
  before_action :authenticate_user! # users must be signed in before any lists_controller method
  
  
  def index
     @lists = current_user.lists
  
  end

  def show
   
    @list = current_user.lists.find(params[:id])
      # @list = current_user.list     
    @items = @list.items
            # current_user.list.find(params[:id]).item
    @new_item = Item.new
    
  end

      def new
       @list = List.new
       
  end
  
      def create
          @list = current_user.lists.build(params.require(:list).permit(:title))           
              #  @list = List.new(params.require(:list).permit(:title))     
      
      if @list.save
          flash[:notice] = "list was saved."
          redirect_to [@list]
      else
          flash[:error] = "There was an error saving the list. Please try again."
          render :new
        end
    end


  def edit
  
    @list = List.find(params[:id])
     # @list = current_user.lists(params[:id])
     # @list = current_user.list.build(params.require(:list).permit(:title))
     # @list = current_user.list.update(params[:id])
     # @list.update_attributes(params.require(:list).permit(:title))
  end
  
  
     def update
       @list = current_user.lists.find(params[:id])
       
     if @list.update_attributes(params.require(:list).permit(:title))
         flash[:notice] = "List was updated."
         redirect_to @list
     else
         flash[:error] = "There was an error saving the list. Please try again."
         render :edit
       end
     end

     def destroy
     @list = List.find(params[:id])
       name = @list.title
 
     
     if @list.destroy
       flash[:notice] = "\"#{name}\" was deleted successfully."
       redirect_to lists_path
     else
       flash[:error] = "There was an error deleting the list."
       render :show
     end
   end

  
  
end
