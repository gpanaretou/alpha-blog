class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            flash[:notice] = "Welcome to Alpha Blog, you have successfully signed up!"
            redirect_to '/'
        else
            render :new, status: :unprocessable_entity
        end
    end

    privategit
    def user_params
        params.require(:user).permit(:username, :email, :password)
    end

end