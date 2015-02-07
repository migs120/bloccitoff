class ItemsController < ApplicationController
  respond_to :html, :js
  
  def index
    
  end

  def show  #item controller
   @list = current_user.lists.find(params[:list_id])
   @item = @list.items.find(params[:id])
   @item1 = @list.items
    @item_del =@list, Item.find(params[:id])
   # @days_left = days_left
    
    #======test variables=====
    
#     @item = current_user.lists
#     @item1 = @item.all
#     @item2 = @item.methods
    
    
    
  end

  def new
    @list = current_user.lists.find(params[:list_id])
    @item = @list, Item.new
  end
  
  def create
    @list = current_user.lists.find(params[:list_id])
    @item= @list.items.build(params.require(:item).permit(:name))           
              #  @list = List.new(params.require(:list).permit(:title))     
      
    if @item.save
          flash[:notice] = "list was saved."
      redirect_to [@list]
      else
          flash[:error] = "There was an error saving the list. Please try again."
          render :new
        end
    end
  
  

  def edit
    @item_edit = current_user.lists.find(params[:list_id]), Item.find(params[:id])
             
                      #====IGNORE THIS===path finding testting====
                        # @list = List.find(params[:id])
                        @a1 ="edit controler"
                        @a2 = current_user.lists.find(params[:list_id]), Item.find(params[:id])
                        # @item = Item.find(params[:id])
          end
  
  def update
    @item1 = current_user.lists.find(params[:list_id]).items.find(params[:id])
     @item = current_user.lists.find(params[:list_id]), Item.find(params[:id])
       
    if @item1.update_attributes(params.require(:item).permit(:name))
         flash[:notice] = "List was updated."
      redirect_to @item
     else
         flash[:error] = "There was an error saving the list. Please try again."
         render :edit
       end
     end
  
  
     def destroy
       @list = current_user.lists.find(params[:list_id])
       @item = Item.find(params[:id])
        name = @item.name
   
 
       if @item.destroy
             flash[:notice] = "\"#{name}\" was deleted successfully."
             redirect_to @list
       else
               flash[:error] = "There was an error deleting the post."
                 render :show
        end
       
              
   end
  
# list_item GET    /lists/:list_id/items/:id(.:format)      items#show 

  
  
  
end






















