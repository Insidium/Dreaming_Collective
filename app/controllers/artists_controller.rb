class ArtistsController < ApplicationController
    
    # Display all artists
    def index
        @artists = Artist.all
    end

    # Display selected artist
    def show
        @artist = Artist.find(params[:id])
    end

    # New artist
    def new
        @artist = Artist.new
        @artist.advocate = Advocate.first
    end

    # Sales history
    def sales
        @sales = current_user.artist.items
    end
    
    # Create new artist and send confirmation/throw error
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

    # Edit artist profile
    def edit
        @artist = Artist.find(params[:id])
    end

    # Accept edits and update artist
    def update
        @artist = Artist.find(params[:id])
        @artist.bio = params[:artist][:bio]
        if @artist.save
            redirect_to artist_path
        end
    end

    def donate
        @artist = Artist.find(params[:id])
        donation = params[:donate].to_f
        @session = Stripe::Checkout::Session.create(
            payment_method_types: ['card'],
            line_items: [{
              name: "Donate to #{@artist.user.first_name} #{@artist.user.last_name}'s Community",
              description: "Donation",
              amount: (donation * 100).to_i,
              currency: 'aud',
              quantity: 1,
            }],
            success_url: "#{root_url}artists/donate/complete",
            cancel_url: "#{root_url}",
            )

        respond_to do |format|
            format.js # render donate.js.erb
        end
    end
    
    # Set artist params
    private 
    def artist_params
        params.require(:artist).permit(:nation, :bio, :artist_image)
    end
end

