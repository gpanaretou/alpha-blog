class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            flash[:notice] = "User was created successfully."
            redirect_to '/'
        else
            render :new, status: :unprocessable_entity
            
        end
    end


end