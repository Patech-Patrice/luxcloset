class ShoesController < ApplicationController
#get method for a new shoe entry
  def new
    #byebug
      @shoe = Shoe.new
      #byebug
      @shoe.build_designer
  end

  def create
    #@shoe = current_user.shoes.build(shoe_params)
    #byebug
    @shoe = Shoe.new(shoe_params)
    @shoe.user_id = session[:user_id]
    if @shoe.save!
    redirect_to shoe_path(@shoe)
    else
    render :new
    end
    end

  #get method to place all shoes in the database
  def index
    #byebug
    @shoes = Shoe.all
     #byebug
   end


      #get method that finds a shoe by id
       def show
       @shoe = Shoe.find_by_id(params[:id])
       end



     private


       #strong params
       def shoe_params
           params.require(:shoe).permit(:brand, :color, :fabric, :designer_id, designer_attributes:[ :name, :country])
       end

     end
