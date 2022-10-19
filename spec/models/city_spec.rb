require 'rails_helper'

RSpec.describe "'/cities' display" do
  before(:each) do
    @nyc = City.create!(name: 'New York City', pro_teams: 7, multiple_venues: true, created_at: 30.second.ago)
    @chicago = City.create!(name: 'Chicago', pro_teams: 7, multiple_venues: true, created_at: Time.now - 30.hours)
    @green_bay = City.create!(name: 'Green Bay', pro_teams: 1, multiple_venues: false, created_at: Time.now - 15.hours)
    @yankee = @nyc.venues.create!(name: 'Yankee Stadium', main_sport: 'Baseball', max_capacity: 46537, dome: false)
    @msg = @nyc.venues.create!(name: 'Madison Square Garden', main_sport: 'Basketball', max_capacity: 19812, dome: true)
    @barclays = @nyc.venues.create!(name: 'Barclays Center', main_sport: 'Basketball', max_capacity: 17732, dome: true)
    @soldier = @chicago.venues.create!(name: 'Soldier Field', main_sport: 'Football', max_capacity: 66944, dome: false)
    @united_center = @chicago.venues.create!(name: 'United Center', main_sport: 'Basketball', max_capacity: 231129, dome: true)
    @wrigley = @chicago.venues.create!(name: 'Wrigley Field', main_sport: 'Baseball', max_capacity: 41649, dome: false)
    @lambeau = @green_bay.venues.create!(name: 'Lambeau Field', main_sport: 'Football', max_capacity: 81441, dome: false)
  end

  describe "Story 6-city Index sorted by Most Recently Created " do
    it "displays records ordered by most recently created first" do
      expect(City.last_created).to eq([@nyc,@green_bay,@chicago])
      # save_and_open_page 
    end
  end

  describe "Story 7-City Show counts number of venues associated with this city" do
    it 'counts the number of venues' do
      expect(@nyc.count_venues).to eq 3
    end
  end

end