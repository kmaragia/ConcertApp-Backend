# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'rest-client'
require 'byebug'

Concert.destroy_all

concert = RestClient.get 'https://app.ticketmaster.com/discovery/v2/attractions.json?size=199&apikey=QJ4IrvJapC374P6xAHNOhamTTtYTleY9'



concert_array = JSON.parse(concert)["_embedded"]["attractions"]


concert_array.each do |concert|
 Concert.create(name: concert["name"], location: concert["locale"])
end
