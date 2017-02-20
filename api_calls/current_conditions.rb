require_relative 'weather_underground_endpoint'

class CurrentConditions < WeatherUndergroundEndpoint
  def initialize
    super('conditions', 'data/conditions.json')
  end
end
