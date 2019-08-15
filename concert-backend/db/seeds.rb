require 'rest-client'
require 'byebug'

Concert.destroy_all

concert = RestClient.get 'https://app.ticketmaster.com/discovery/v2/events.json?classificationName=music&size=199&apikey=QJ4IrvJapC374P6xAHNOhamTTtYTleY9'



concert_array = JSON.parse(concert)["_embedded"]["events"]


concert_array.each do |concert|
 Concert.create!(artist_id: concert["id"], name:concert["name"], location:concert["_embedded"]["venues"][0]["city"]["name"], img: concert["images"][0]["url"], date:concert["dates"]["start"]["dateTime"], time: concert["dates"]["start"]["localTime"], venue_address: concert["_embedded"]["venues"][0]["address"]["line1"])
end
