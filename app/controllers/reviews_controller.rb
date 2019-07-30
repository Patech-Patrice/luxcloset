class ReviewsController < ApplicationController

    #def new
        #if @designer = Designer.find_by_id(params[:designer_id])
          #@review = @designer.reviews.build
        #else
          #@review = Review.new
        #end
      #end

   
       def new
          @designer = Designer.find_by_id(params[:designer_id])
          @review = @designer.reviews.build
      end
      
    def create
    end
    
    def show
    end


    def index
    end

    private

    def review_params
        params.require(:review).permit(:designer_id, :content, :stars, :title)
    end

end

