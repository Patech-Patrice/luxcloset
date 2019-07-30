class HandbagsController < ApplicationController

  def new
    #byebug
      @handbag = Handbag.new
      #byebug
      @handbag.build_designer
  end
    
  def create
    #byebug
    @handbag = Handbag.new
    @handbag.brand = params[:brand]
    @handbag.color = params[:color]
    @handbag.fabric = params[:fabric]
    byebug
      redirect_to handbag_path(@handbag)
    end
      
    def index
       @handbags = Handbag.all
    end
         
           def show
           @handbag = Handbag.find(params[:id])
           end
         
         private
    
           #strong params
           def handbag_params
               params.require(:handbag).permit(:name, :brand, :color, :fabric, designer_attributes:[:name, :country])
           end
         
         end
    
    

