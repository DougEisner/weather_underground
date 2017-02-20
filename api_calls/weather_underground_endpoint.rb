require 'net/http'
require 'json'
require_relative 'in_memory_cache'
require_relative 'file_system_cache'

class WeatherUndergroundEndpoint
  def initialize(endpoint, fs_cache_filename)
    @endpoint = endpoint
    @api_key = '1d9dc1111805258f'
    @in_memory_cache = InMemoryCache.new
    @fs_cache = FileSystemCache.new(fs_cache_filename)
  end

  def get(location)
    if @in_memory_cache.key? location
      # puts "in memory cache hit: #{location}"
      # If memory cache includes this location, it's retrieved from memory.
      @in_memory_cache.get location

    elsif @fs_cache.key? location
      # puts "file system cache hit: #{location}"
      # if file system includes this location, it's retrieved from fs.
      data = @fs_cache.get location

      # If retrieved from fs, it's written to memory cache.
      @in_memory_cache.set location, data

      data
    else
      # puts "cache miss: #{location}"

      # if neither in fs or memory, makes an api call.
      url = "http://api.wunderground.com/api/#{@api_key}/#{@endpoint}/q/#{location}.json"

      response = Net::HTTP.get(URI(url))

      data = JSON.parse(response)

      # writes to memory cache and fs.
      @in_memory_cache.set location, data

      @fs_cache.set location, data

      data
    end
  end
end
