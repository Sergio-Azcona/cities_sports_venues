require 'rails_helper'

RSpec.describe "''/venue_table_name'' display" do
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

  it "Story 3-displays the venue with that id including the venues attributes" do
    visit "/venues"
    # require 'pry';binding.pry
    # save_and_open_page 
    expect(page).to have_content(@yankee.name)
    expect(page).to have_content(@wrigley.main_sport)
    expect(page).not_to have_content(@nyc.name)
  end

end