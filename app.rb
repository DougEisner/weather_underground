require 'net/http'
require 'json'
require 'pry'
require 'redis'

def get_artist_id(name)
  url = "https://api.spotify.com/v1/search?q=#{name}&type=artist"
  # TODO: check redis for key, return if exists, otherwise continue
  response = Net::HTTP.get(URI(url))
  data = JSON.parse(response)
  artist_id = data["artists"]["items"][0]["id"]
  puts "The #{name} artist id is #{artist_id}"
  puts ''
  artist_id
end


def get_top_tracks(artist_id)
  url = "https://api.spotify.com/v1/artists/#{artist_id}/top-tracks?country=US"
  # TODO: check redis for key, return if exists, otherwise continue


  response = Net::HTTP.get(URI(url))
  top_track_data = JSON.parse(response)
  tracks = top_track_data['tracks']



  count = 0
  10.times do |name|
    track = tracks[count]['name']
    puts "Track #{count + 1}: #{track}"
    count += 1
  end

  #TODO set Redis cash key = url, value = data
end



def main

puts 'Enter the name of an artist to look up:'
artist_name = gets.chomp
artist_id = get_artist_id(artist_name)

get_top_tracks(artist_id)

end

main if __FILE__ == $PROGRAM_NAME
