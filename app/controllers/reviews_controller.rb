class ReviewsController < ApplicationController
  before_action :require_login
  before_action :set_review, only: [:update, :edit, :destroy]
  before_action :check_user, only: [:edit, :update, :destroy]


  def new
     @designer = Designer.find_by_id(params[:designer_id])
     @review = @designer.reviews.build
 end

 def create
  @review = current_user.reviews.build(review_params)
  if @review.save #checks to make sure the object exists
   redirect_to review_path(@review)
  else
   render :new
   end
 end

 def show
   @review = Review.find_by_id(params[:id])
end

#nesting is important here, shows all reviews for all designers
def index
   #check's if it's nested & valid id
  if @designer = Designer.find_by_id(params[:designer_id])
   #nested
   @reviews = @designer.reviews
  else
   #not nested
   @reviews = Review.all
  end
end 

def edit 
  set_review   
end

def update
  set_review
  if @review.update(review_params)
  redirect_to review_path(@review)
  else
  render :edit
  end
end 

def destroy
  set_review
  @review.destroy
  redirect_to reviews_path
end 


private

def set_review
  @review = Review.find_by(id: params[:id])
  if !@review
  redirect_to reviews_path
  end
end

def review_params
   params.require(:review).permit(:designer_id, :content, :stars, :title)
end

def check_user
  @review = Review.find_by_id(params[:id])
  unless current_user.id == @review.user_id
  redirect_to root_path
  end
end

end


