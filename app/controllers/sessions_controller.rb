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

      if params[:provider] == 'google_oauth2'
        @user = User.create_by_google_omniauth(auth)
        session[:user_id] = @user.id
        #byebug
        redirect_to user_path(@user)
      else 
      #find the user
       @user = User.find_by(username: params[:user][:username][:email])
       
       #if we find something & they have the right password
      #byebug
       if @user.try(:authenticate, params[:user][:password])
          session[:user_id] = @user.id
          redirect_to user_path(@user)
       else
          flash[:error] = "Sorry, login info was incorrect. Please try again."
          #redirect to login to make it harder for account break-ins
          redirect_to login_path
          #byebug
        end
      end
    end
    
  
    def omniauth
      @user = User.create_by_google_omniauth(auth) 
      session[:user_id] = @user.id
      #byebug
      redirect_to user_path(@user)
    end

    private

    def auth
      request.env['omniauth.auth']
    end
  end
