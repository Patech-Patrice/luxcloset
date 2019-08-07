class HandbagsController < ApplicationController

  def new
    #byebug
      @handbag = Handbag.new
      #byebug
      @handbag.build_designer
  end
    
  def create
    #byebug
    @handbag = Handbag.new(handbag_params)
    @handbag.user_id = session[:user_id]
    #byebug
    if @handbag.save
    redirect_to handbag_path(@handbag)
    else
    @handbag.build_designer
    render :new
    end
  end
      
  def index
      @handbags = Handbag.all
   end
         
  def show
    #@handbag = Handbag.find(params[:id])
    set_handbag
  end


  def edit 
    set_handbag     
  end

  def update
    set_handbag
    if @handbag.update(handbag_params)
      redirect_to handbag_path(@handbag)
    else
      render :edit
  end
end 
  
  def destroy
    set_handbag
    @handbag.destroy
    redirect_to handbags_path
  end 

  private

  def set_handbag
    @handbag = Handbag.find(params[:id])
    if !@handbag
      redirect_to handbags_path
    end
  end
    
           #strong params
    def handbag_params
        params.require(:handbag).permit(:name, :brand, :color, :fabric, designer_attributes:[:name, :country])
    end
         
end
    
    

