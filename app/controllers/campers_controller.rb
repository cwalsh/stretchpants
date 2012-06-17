class CampersController < ApplicationController
  def index
    @campers = params[:query].blank? ? Camper.all : Camper.search(params[:query].to_s)
  end

  def search
    @query = params[:query] || "*"
    @campers = Camper.search do |search|
      search.query do |query|
        query.string @query
      end

      search.sort { by :name, 'asc' }

      unless params[:tags].blank?
        search.filter :term, :tags => params[:tags]
      end

      search.facet 'tags', :global => true do
        terms :tags
      end
    end
    render :index
  end

  def show
    @camper = Camper.find(params[:id].to_s)
  end

  def new
    @camper = Camper.new
  end

  def edit
    @camper = Camper.find(params[:id].to_s)
  end

  def update
    params[:camper][:tags] = params[:camper][:tags].gsub(/,/, ' ').split(' ')
    @camper = Camper.find(params[:id])
    @camper.update_attributes(params[:camper])
    redirect_to @camper
  end

  def create
    params[:camper][:tags] = params[:camper][:tags].gsub(/,/, ' ').split(' ')
    @camper = Camper.create(params[:camper])
    redirect_to @camper
  end

end
