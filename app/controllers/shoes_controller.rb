class ShoesController < ApplicationController

before_action :set_shoe, only: [:show, :edit]
#before_action :logged_in?, only: [:index]
before_action :check_user, only: [:edit, :update, :destroy]

def new
  if logged_in?
  @shoe = Shoe.new
  @shoe.build_designer
  else 
    redirect_to login_path
end
end


def create
 @shoe = Shoe.new(shoe_params)
 @shoe.user_id = session[:user_id]
  if @shoe.save
   redirect_to shoe_path(@shoe)
  else
   render :new
 end
end

def index
  if logged_in?
  @shoes = Shoe.all
  else
    redirect_to login_path
end
end



#get method that finds a shoe by id
def show
end


def edit 
end



def search
  if params[:search].blank?
    @shoes = Shoe.all
  else
    @shoes = Shoe.search(params)
  end
end



def update
  @shoe = Shoe.find_by(id: params[:id])
  if @shoe.update(shoe_params)
    redirect_to shoe_path(@shoe)
  else
    render :edit
  end
 end 

def destroy
  @shoe.destroy
  redirect_to shoes_path
end 

private


def set_shoe
  @shoe = Shoe.find(params[:id])
  #if the shoe doesn't exist redirect
  if !@shoe
    redirect_to shoes_path
  end
end

   #strong params
   def shoe_params
    params.require(:shoe).permit(:search, :brand, :color, :fabric, :designer_id, designer_attributes: [ :id, :name, :country])
   end

   def check_user
    @shoe = Shoe.find(params[:id])
    unless current_user.id == @shoe.user_id
    redirect_to root_path
  end
end

 end
