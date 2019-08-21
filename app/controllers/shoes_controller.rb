class ShoesController < ApplicationController

before_action :set_shoe, only:[:show, :edit, :update, :destroy] 

#get method for a new shoe entry
def new
  @shoe = Shoe.new
  @shoe.build_designer
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

#get method to place all shoes in the database
def index
@shoes = Shoe.all
end


#get method that finds a shoe by id
def show
  set_shoe
end

def edit 
  set_shoe   
end

def update
  set_shoe
  if @shoe.update(shoe_params)
    redirect_to shoe_path(@shoe)
  else
    render :edit
end
end 

def destroy
  #gives access to the shoe later on
  set_shoe
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
    params.require(:shoe).permit(:brand, :color, :fabric, :designer_id, designer_attributes: [:name, :country])
   end

 end
