class HandbagsController < ApplicationController

  before_action :require_login
  before_action :check_user, only: [:edit, :update, :destroy] 
  before_action :set_handbag, except: [:new, :create, :index, :destroy]
  
  def new
    #if logged_in?
      @handbag = Handbag.new
      @handbag.build_designer
    #else
     # redirect_to login_path
    #end
  end
    
  def create
    @handbag = Handbag.new(handbag_params)
    @handbag.user_id = session[:user_id]
    if @handbag.save
    redirect_to handbag_path(@handbag)
    else
    @handbag.build_designer
    render :new
    end
  end
      
  def index
    #if logged_in?
      @handbags = Handbag.all
    #else
     # redirect_to login_path
    #end
  end
         
  def show
  end

  def edit     
  end

  def update
    @handbag = Handbag.find_by(id: params[:id])
    if @handbag.update(handbag_params)
      redirect_to handbag_path(@handbag)
    else
      render :edit
    end
  end 
  
  def destroy
    #set_handbag
    @handbag.destroy
    redirect_to handbags_path
  end 

  private

  def set_handbag
    @handbag = Handbag.find_by(id: params[:id])
    if !@handbag
      redirect_to handbags_path
    end
  end
    
  #strong params
    def handbag_params
        params.require(:handbag).permit(:name, :brand, :color, :fabric, :designer_id, designer_attributes:[:name, :country])
    end


    def check_user
      @handbag = Handbag.find(params[:id])
      unless current_user.id == @handbag.user_id
      redirect_to root_path
    end
  end


end
    
    

