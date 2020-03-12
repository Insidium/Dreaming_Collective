class UsersController < ApplicationController
    # Dashboard
    def dash
        if current_user.id != params[:id].to_i
            redirect_to home_path
        end
    end
end
