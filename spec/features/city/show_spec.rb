require 'rails_helper'

RSpec.describe "'/cities/:id' display" do
  before(:each) do
    @nyc = City.create!(name: 'New York City', pro_teams: 7, multiple_venues: true)
    @yankee = @nyc.venues.create!(name: 'Yankee Stadium', main_sport: 'Baseball', max_capacity: 46537, dome: false)
    @msg = @nyc.venues.create!(name: 'Madison Square Garden', main_sport: 'Basketball', max_capacity: 19812, dome: true)
    @barclays = @nyc.venues.create!(name: 'Barclays Center', main_sport: 'Basketball', max_capacity: 17732, dome: true)
    @chicago = City.create!(name: 'Chicago', pro_teams: 7, multiple_venues: true)
    @soldier = @chicago.venues.create!(name: 'Soldier Field', main_sport: 'Football', max_capacity: 66944, dome: false)
    @wrigley = @chicago.venues.create!(name: 'Wrigley Field', main_sport: 'Baseball', max_capacity: 41649, dome: false)
    @green_bay = City.create!(name: 'Green Bay', pro_teams: 1, multiple_venues: false)
    @lambeau = @green_bay.venues.create!(name: 'Lambeau Field', main_sport: 'Football', max_capacity: 81441, dome: false)
  end

  it "Story 2-displays the city with that id including the city's attributes" do
    visit "/cities/#{@nyc.id}"
    # require 'pry';binding.pry
    expect(page).to have_content(@nyc.name)
    expect(page).to have_content(@nyc.multiple_venues)
    expect(page).not_to have_content(@green_bay.name)
    save_and_open_page 
  end

  describe "Story 7-City Show: counts number of venues associated with a city" do
    it 'displays the number of venues for the parent' do
      visit "/cities/#{@nyc.id}"
      save_and_open_page 
      expect(@nyc.count_venues).to eq 3
    end
  end
end