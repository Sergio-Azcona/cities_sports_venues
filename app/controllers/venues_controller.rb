class VenuesController < ActionController::Base
  def index
    @venues = Venue.all
  end

  def show
    @venue = Venue.find(params[:id])
  end
end