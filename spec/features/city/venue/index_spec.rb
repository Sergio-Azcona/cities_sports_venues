require 'rails_helper'

RSpec.describe "'/city/:city_id/venues' display" do
  before(:each) do
    @nyc = City.create!(name: 'New York City', pro_teams: 7, multiple_venues: true)
    @yankee = @nyc.venues.create!(name: 'Yankee Stadium', main_sport: 'Baseball', max_capacity: 46537, dome: false)
    @msg = @nyc.venues.create!(name: 'Madison Square Garden', main_sport: 'Basketball', max_capacity: 19812, dome: true)
    @barclays = @nyc.venues.create!(name: 'Barclays Center', main_sport: 'Basketball', max_capacity: 17732, dome: true)
    @chicago = City.create!(name: 'Chicago', pro_teams: 7, multiple_venues: true)
    @soldier = @chicago.venues.create!(name: 'Soldier Field', main_sport: 'Football', max_capacity: 66944, dome: false)
    @united_center = @chicago.venues.create!(name: 'United Center', main_sport: 'Basketball', max_capacity: 231129, dome: true)
    @wrigley = @chicago.venues.create!(name: 'Wrigley Field', main_sport: 'Baseball', max_capacity: 41649, dome: false)
    @green_bay = City.create!(name: 'Green Bay', pro_teams: 1, multiple_venues: false)
    @lambeau = @green_bay.venues.create!(name: 'Lambeau Field', main_sport: 'Football', max_capacity: 81441, dome: false)
  end

  it "Story 5-each venue that is associated with that city with each venue's attributes" do
    visit "/city/#{@nyc.id}/venues"
    expect(page).to have_content(@barclays.dome)
    expect(page).to have_content(@yankee.name)
    expect(page).to have_content(@msg.main_sport)
    expect(page).to have_content(@msg.max_capacity)
    expect(page).not_to have_content(@green_bay.name)
    expect(page).not_to have_content(@lambeau.name)
    save_and_open_page 
  end

end