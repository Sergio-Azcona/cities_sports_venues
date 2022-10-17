require 'rails_helper'

RSpec.describe "'/cities' display" do
  before(:each) do
    @nyc = City.create!(name: 'New York City', pro_teams: 7, multiple_venues: true)
    @nyc.venues.create!(name: 'Yankee Stadium', main_sport: 'Baseball', max_capacity: 46537, dome: false)
    @nyc.venues.create!(name: 'Madison Square Garden', main_sport: 'Basketball', max_capacity: 19812, dome: true)
    @nyc.venues.create!(name: 'Barclays Center', main_sport: 'Basketball', max_capacity: 17732, dome: true)
    @chicago = City.create!(name: 'Chicago', pro_teams: 7, multiple_venues: true)
    @chicago.venues.create!(name: 'Guaranteed Rate Field', main_sport: 'Baseball', max_capacity: 40615, dome: false)
    @chicago.venues.create!(name: 'Soldier Field', main_sport: 'Football', max_capacity: 66944, dome: false)
    @chicago.venues.create!(name: 'United Center', main_sport: 'Basketball', max_capacity: 231129, dome: true)
    @chicago.venues.create!(name: 'Wintrust Arena', main_sport: 'Basketball', max_capacity: 10387, dome: true)
    @chicago.venues.create!(name: 'Wrigley Field', main_sport: 'Baseball', max_capacity: 41649, dome: false)
    @green_bay = City.create!(name: 'Green Bay', pro_teams: 1, multiple_venues: false)
    @green_bay.venues.create!(name: 'Lambeau Field', main_sport: 'Football', max_capacity: 81441, dome: false)
  end

  it "displays name of each city record in the system" do
    visit '/cities'

    expect(page).to have_content(cities.name)
  end

end