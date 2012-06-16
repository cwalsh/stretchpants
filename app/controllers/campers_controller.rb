class CampersController < ApplicationController
  def index
    @campers = params[:query].blank? ? Camper.all : Camper.search(params[:query].to_s)
  end
  
  def show
    @camper = Camper.find(CGI.escape(params[:id].to_s))
  end
  
  def new
    @camper = Camper.new
  end

  def edit
    @camper = Camper.find(CGI.escape(params[:id].to_s))
  end

  def update
    params[:camper][:tags] = params[:camper][:tags].gsub(/,/, ' ').split(' ')
    @camper = Camper.find(params[:id].to_s)
    @camper.update_attributes(params[:camper])
    redirect_to @camper
  end
  
  def create
    params[:camper][:tags] = params[:camper][:tags].gsub(/,/, ' ').split(' ')
    @camper = Camper.create(params[:camper])
    redirect_to @camper
  end

end
