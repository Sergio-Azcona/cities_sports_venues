class CitiesController < ActionController::Base
  def index
    @cities = City.all
  end

  def show
    # require 'pry';binding.pry
    @city = City.find(params[:id])
  end
end