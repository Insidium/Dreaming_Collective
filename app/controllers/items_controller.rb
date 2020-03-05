class ItemsController < ApplicationController
    
    def index
        @items = Item.order_by_artist_name
    end

    # # if user_signed_in? as artist?
    # def show
    #     @item = Item.find(params[:id])
    # end

    def new
        @item = Item.new
    end

    def create
        item = Item.new(item_params)
        item.artist_id = current_user.id
        if item.save
            flash[:notice] = "Deadly! Artwork added successfully."
            redirect_to item_path(item.id)
        else
            flash[:alert] = item.errors.full_messages[0]
            redirect_to new_item_path
        end
    end

    private 
    def item_params
        params.require(:item).permit(:name,:category, :description, :price, :item_image)
    end

end
