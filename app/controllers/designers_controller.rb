class DesignersController < ApplicationController

  #def new
    #@designer = Designer.new
  #end

  #def create
      #binding.pry
      #@designer = Designer.new(designer_params)
      #@designer.user_id = session[:user_id]
     #byebug
      #if @designer.save!
        #redirect_to designer_path(@designer)
      #else
        #render :new
    #end
  ##end

  def index
    @designers = Designer.all
end

#def show
 # @designer = Designer.find_by(id: params[:id])
#end



 #private


   #strong params
   #def designer_params
       #params.require(:designer).permit(:name, :country)
   #end

 end
