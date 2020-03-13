class UsersController < ApplicationController
    # Sets redirect to root path if user is not signed in and to avoid users seeing other users dashboards
    def dash
        if current_user.id != params[:id].to_i
            redirect_to home_path
        end
    end
end
