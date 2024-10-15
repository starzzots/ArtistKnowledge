require 'sinatra'
require 'sinatra/reloader'
require 'rspotify'
require 'json'

# Configure RSpotify with your Spotify credentials
RSpotify.authenticate(ENV.fetch("SPOTIFY_CLIENT_ID"), ENV.fetch("SPOTIFY_SERCRET_ID"))

# Home route
get '/' do
  erb(:index)
end

# Search route
get('/search') do
  @artist_name = params[:artist_name]
  @artist = RSpotify::Artist.search(@artist_name).first

  if @artist
    @top_tracks = @artist.top_tracks(:US)
    @albums = @artist.albums
  else
    @error = "Artist not found"
  end

  erb(:search)
end
