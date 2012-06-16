class CampersController < ApplicationController
  def index
    @campers = Camper.search "*"
  end
end
