class ApplicationController < ActionController::Base

helper_method :current_user, :logged_in?
  
  private

    def current_user
      @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    end


def logged_in?
  !!current_user
end

#how to implement in other controller actions
def require_login
  redirect_to login_path if !logged_in?
end


end
