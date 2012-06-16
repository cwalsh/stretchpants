class CampersController < ApplicationController
  def index
    @campers = Camper.search "*"
  end
  
  def show
    @camper = Camper.search(params[:id].to_s).first
  end
  
  def new
    @camper = Camper.new
  end
  
  def create
    @camper = Camper.create(params[:camper])
    sleep(1)
    redirect_to @camper
  end
  
end
