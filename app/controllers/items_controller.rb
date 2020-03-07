class ItemsController < ApplicationController
    
    def index
        @items = Item.all_items()
    end

    def show
        @item = Item.find(params[:id])
    end

    def new
        @item = Item.new
    end

    def create
        item = Item.new(item_params)
        item.artist_id = current_user.artist.user_id
        item.item_image.attach(params[:item][:item_image])
        if item.save
            flash[:notice] = "Deadly! Artwork added successfully."
            redirect_to item_path(item.id)
        else
            flash[:alert] = item.errors.full_messages[0]
            redirect_to new_item_path
        end
    end

    def destroy
        Item.destroy(params[:id])
        flash[:notice] = "Artwork was successfully removed from your Gallery."
        redirect_to dashboard_path
    end

    private 
    def item_params
        params.require(:item).permit(:name,:category, :description, :price, :item_image)
    end

end
