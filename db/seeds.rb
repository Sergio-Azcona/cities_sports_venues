# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
City.destroy_all
Venue.destroy_all

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

