require "sinatra"
require "sinatra/reloader"
require 'rspotify'

RSpotify.authenticate(ENV.fetch('SPOTIFY_CLIENT_ID'), ENV.fetch('SPOTIFY_SERCRET_ID'))

get("/") do
  @artist = RSpotify::Artist.search('Artist Name').first
  erb(:homepage)
end
