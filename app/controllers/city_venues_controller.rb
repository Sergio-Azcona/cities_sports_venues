class CityVenuesController < ActionController::Base
  def index
    # require 'pry';binding.pry
    @city = City.find(params[:id])
    @venues = @city.venues
  end
end