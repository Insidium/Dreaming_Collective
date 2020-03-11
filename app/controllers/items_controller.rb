class ItemsController < ApplicationController
    
    # Show all artwork
    def index
        @items = Item.all_items()
    end

    # Show selected artwork
    def show
        @item = Item.find(params[:id])
    end

    # New artwork
    def new
        @item = Item.new
    end

    # Create new artwork listing
    def create
        item = Item.new(item_params)
        item.artist_id = current_user.artist.id
        item.item_image.attach(params[:item][:item_image])
        if item.save
            flash[:notice] = "Deadly! Artwork added successfully."
            redirect_to item_path(item.id)
        else
            flash[:alert] = item.errors.full_messages[0]
            redirect_to new_item_path
        end
    end

    # Delete artwork listing (if user is owner)
    def destroy
        Item.destroy(params[:id])
        flash[:notice] = "Artwork was successfully removed from your Gallery."
        redirect_to dashboard_path
    end

    # Set artwork params
    private 
    def item_params
        params.require(:item).permit(:name,:category, :description, :price, :item_image)
    end

end
