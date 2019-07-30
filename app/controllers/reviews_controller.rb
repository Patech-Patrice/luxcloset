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
       @review = current_user.reviews.build(review_params)
       if @review.save! #checks to make sure the object exists
        redirect_to review_path(@review)
       else
        render :new
        end
      end

      def show
        @review = Designer.find_by_id(params[:id])
    end

#nesting is important here
    def index
    end


    private

    def review_params
        params.require(:review).permit(:designer_id, :content, :stars, :title)
    end

end

