require_relative 'weather_underground_endpoint'

class TenDayForecast < WeatherUndergroundEndpoint
  def initialize
    super('forecast10day', 'data/forecast10day.json')
  end
end
