class CampersController < ApplicationController
  def index
    @campers = params[:query].blank? ? Camper.all : Camper.search(params[:query].to_s)
  end
  
  def show
    @camper = Camper.find(params[:id].to_s)
  end
  
  def new
    @camper = Camper.new
  end
  
  def create
    @camper = Camper.create(params[:camper])
    redirect_to @camper
  end

end
