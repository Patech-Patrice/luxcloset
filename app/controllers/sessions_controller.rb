class SessionsController < ApplicationController

    def home
    end

    def destroy
      session.delete(:user_id)
      redirect_to '/'
    end
  
    def new
    end

  
    def create
       #find the user
       @user = User.find_by(username: params[:user][:username])
       #did we find the user & did they put in the right password?
       
       #if we find something & they have the right password
       if @user && @user.authenticate(params[:user][:password])
       if @user.try(:authenticate, params[:user][:password])
          session[:user_id] = @user.id
          redirect_to user_path(@user)
       else
          flash[:error] = "Sorry, login info was incorrect. Please try again."
          #redirect to login to make it harder for account break-ins
          redirect_to login_path
        end
      end
    end
  
    def omniauth
      #byebug
      #@user = User.where(email: auth[:info][:email])
      #session[:user_id] = @user.id
      #redirect_to user_path(@user)
      User.find_or_create_by(:email)
      User.where(email: auth[:info][:email])
    end

    private

    def auth
      request.env['omniauth.auth']
    end

  end
