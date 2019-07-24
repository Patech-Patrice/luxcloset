class UsersController < ApplicationController
    #this method instantiates an empty new user object and renders the sign_up form
    #once a user is saved, they are redirected to the root url
      #code...
    #loading the signup form
    def new
      @user = User.new
    end
    
    #signup
    def create
      @user = User.new(user_params)
      if @user.save
        #login the user
        session[:user_id] = @user.id #stores @user.id in a cookie session
        redirect_to user_path(@user)
        #flash message to welcome new users
        #notice = "Welcome to your Luxury Closet Organizer!"
      else
        render :new
      end
    end
    
    def show
      @user = User.find_by_id(params[:id])
    redirect_to '/' if !@user
    end
    
    private
    
    def user_params
      params.require(:user).permit( :username, :email, :password)
    end
    
    
    end
