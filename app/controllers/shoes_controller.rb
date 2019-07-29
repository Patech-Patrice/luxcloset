class ShoesController < ApplicationController
#get method for a new shoe entry
  def new
    #byebug
      @shoe = Shoe.new
      #byebug
      @shoe.build_designer
  end

  def create
    @shoe = Shoe.new
    @shoe.brand = params[:brand]
    @shoe.color = params[:color]
    @shoe.fabric = params[:fabric]
    @shoe.save
    redirect_to shoes_path(@shoe)
    end

  #get method to place all shoes in the database
  def index
    #byebug
    @shoes = Shoe.all
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
