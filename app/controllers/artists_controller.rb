class ArtistsController < ApplicationController
    
    def index
        @artists = Artist.all
    end

    def show
        @artist = Artist.find(params[:id])
    end

    def new
        @artist = Artist.new
        @artist.advocate = Advocate.first
    end
    
    def create
        artist = Artist.new(artist_params)
        artist.user_id = current_user.id
        if artist.save
            flash[:notice] = "Deadly! You are now an Artist."
            redirect_to dashboard_path(current_user.id)
        else
            flash[:alert] = artist.errors.full_messages[0]
            redirect_to new_artist_path
        end
    end

    def edit
        @artist = Artist.find(params[:id])
    end

    def update
        @artist = Artist.find(params[:id])
        @artist.bio = params[:artist][:bio]
        if @artist.save
            redirect_to artist_path
        end
    end
    
    private 
    def artist_params
        params.require(:artist).permit(:nation, :bio, :artist_image)
    end
end

