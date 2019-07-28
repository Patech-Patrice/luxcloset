class HandbagsController < ApplicationController
    
        def index
            @handbags = Handbag.all
           end
         
           def show
           @handbag = Handbag.find(params[:id])
           end
         
         
           def new
             @handbag = Handbag.new
             @handbag.build_designer
           end
         
         
           def create
             #@shoe = current_user.shoes.build(shoe_params)
             @handbag = Handbag.new(handbag_params)
             @handbag.user_id = session[:user_id]
             #byebug
             if @handbag.save!
               redirect_to handbag_path(@handbag)
             else
              @shoe.build_designer
               render :new
         
           end
         end
         
         private
         
           def show
             
             @handbag = Handbag.find( params[:id])
           end
         
         
         
         
         
         
         
          
         
           #strong params
           def handbag_params
               params.require(:handbag).permit(:name, :brand, :color, :fabric, designer_attributes:[:name, :country])
           end
         
         end
    
    

