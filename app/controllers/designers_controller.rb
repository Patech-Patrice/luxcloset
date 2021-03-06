class DesignersController < ApplicationController

  before_action :require_login

  def new
    @designer = Designer.new
  end

  def create
      @designer = Designer.new(designer_params)
      @designer.user_id = session[:user_id]
      if @designer.save #validation happens here
        redirect_to designer_path(@designer)
      else
        render :new
      end
  end

  def index
    #if logged_in?
    @designers = Designer.alpha
    #else
     # redirect_to login_path
    #end
  end

def show
  @designer = Designer.find_by(id: params[:id])
end


#implement this method later as an option to users
#def destroy
  #@designer = Designer.find_by(id: params[:id])
  #set_designer
  #@designer.destroy!
  #redirect_to designers_path
#end 

 private

 def set_designer
  @designer = Designer.find(params[:id])
  #if the designer doesn't exist redirect
  if !@designer
    redirect_to designers_path
  end
end

   def designer_params
       params.require(:designer).permit(:name, :country)
   end

end
