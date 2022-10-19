require 'rails_helper'

RSpec.describe "'/cities' display" do
  before(:each) do
    @nyc = City.create!(name: 'New York City', pro_teams: 7, multiple_venues: true, created_at: Time.now - 3.hours)
    @chicago = City.create!(name: 'Chicago', pro_teams: 7, multiple_venues: true, created_at: Time.now - 120.hours)
    @green_bay = City.create!(name: 'Green Bay', pro_teams: 1, multiple_venues: false, created_at: Time.now - 30.hours)
    @yankee = @nyc.venues.create!(name: 'Yankee Stadium', main_sport: 'Baseball', max_capacity: 46537, dome: false)
    @msg = @nyc.venues.create!(name: 'Madison Square Garden', main_sport: 'Basketball', max_capacity: 19812, dome: true)
    @barclays = @nyc.venues.create!(name: 'Barclays Center', main_sport: 'Basketball', max_capacity: 17732, dome: true)
    @soldier = @chicago.venues.create!(name: 'Soldier Field', main_sport: 'Football', max_capacity: 66944, dome: false)
    @united_center = @chicago.venues.create!(name: 'United Center', main_sport: 'Basketball', max_capacity: 231129, dome: true)
    @wrigley = @chicago.venues.create!(name: 'Wrigley Field', main_sport: 'Baseball', max_capacity: 41649, dome: false)
    @lambeau = @green_bay.venues.create!(name: 'Lambeau Field', main_sport: 'Football', max_capacity: 81441, dome: false)
  end

  it "Story 1, displays name of each city record in the system" do
    visit '/cities'
    # require 'pry';binding.pry
    expect(page).to have_content(@nyc.name)
    expect(page).to have_content(@green_bay.name)
    expect(page).not_to have_content(@yankee.name)
  end

  describe "Story 6-Parent Index sorted by Most Recently Created " do
    it "next to each of the records I see when it was created" do
      visit '/cities'
      save_and_open_page
      expect(page).to have_content("Created At 2022-10")
      expect(page).not_to have_content("Created At 2225-10")
    end
  end

  describe "Story 9-pages have City Index link, except the the city#index pages" do
    it "should have a link to the city index"do
    end
  end

end