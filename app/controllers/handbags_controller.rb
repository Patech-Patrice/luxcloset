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
             @handbag = Handbag.create(handbag_params)
             @handbag.user_id = session[:user_id]
             #byebug
             if @handbag.save
               redirect_to handbag_path(@handbag)
             else
               render :new
         
           end
         end
         
         private
         
           def show
             #set_shoe
             @handbag = Handbag.find( params[:id])
           end
         
         
         
           #def destroy
             #set_shoe
             #@shoe.destroy
             #redirect_to shoes_path
           #end
         
         
         
         
           # this method calls the Shoe.find method to retrieve the shoe with an params corresponding to the params passed to the controller.
           #def set_shoe
              #@shoe = Shoe.find_by(id: params[:id])
              #@shoe = Shoe.find(params[:user_id], params[:name], params[:brand], params[:url], params[:color], params[:designer_id], params[:style])
             #if !@shoe
               #redirect_to shoes_path
           #end
         #end
         
           #strong params
           def handbag_params
               params.require(:shoe).permit(:name, designer_attributes:[:name])
           end
         
         end
    
    

