class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    before_action :require_same_user, only: [:edit, :update, :destroy]

    def new
        @user = User.new
    end

    def show
        @articles = @user.articles.paginate(:page => params[:page], :per_page => 5)
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            flash[:notice] = "Welcome to Alpha Blog, you have successfully signed up!"
            redirect_to '/'
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit

    end

    def update
        if @user.update(user_params)
            flash[:notice] = "Your account information was successfully updated"
            redirect_to @user
        else
            render 'edit', status: :unprocessable_entity
        end
    end

    def index      
        @user = User.paginate(:page => params[:page], :per_page => 5)
    end

    def login
    
    end

    def destroy
        @user.destroy
        session[:user_id] = nil if @user == current_user
        flash[:notice] = "Account successfully deleted."
        redirect_to '/'
    end


    private
    def user_params
        params.require(:user).permit(:username, :email, :password)
    end

    def set_user
        @user = User.find(params[:id])
    end

    def require_same_user
        if !(logged_in? && current_user == @user) && !current_user.admin? 
            flash[:alert] = "You can only edit your profile"
            redirect_to @user
        end
    end


end