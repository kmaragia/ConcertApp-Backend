require 'rubygems'
require 'httparty'

class Api
  include HTTParty
  base_uri "https://app.ticketmaster.com/discovery/v2/events.json?countryCode=CA&apikey=QJ4IrvJapC374P6xAHNOhamTTtYTleY9"

  def posts
    self.class.get('/posts.json')
  end
end


  concert1 = Api.new
  puts concert1.posts
