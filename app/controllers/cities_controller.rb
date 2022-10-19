class CitiesController < ActionController::Base
  def index
    @cities = City.last_created
  end

  def show
    @city = City.find(params[:id])
    # @venue_count = @city.count_venues
  end
end