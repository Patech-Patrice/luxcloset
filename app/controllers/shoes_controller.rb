class ShoesController < ApplicationController

    def new
        @shoe = Shoe.new
        @shoe.build_designer
    end



    def create
        context.pry
        #@shoe = current_user.shoes.build(shoe_params)
        @shoe = Shoe.new(shoe_params)
        @shoe.user_id = session[:user_id]
       byebug
        if @shoe.save!
          redirect_to shoe_path(@shoe)
        else
          render :new

      end
    end

    def index
        @shoe = Shoe.all
       end

       def show
       @shoe = Shoe.find_by_id(params[:id])
       end



     private


       #strong params
       def shoe_params
           params.require(:shoe).permit(:brand, :color, :fabric, :designer_id, designer_attributes:[ :name, :country])
       end

     end
