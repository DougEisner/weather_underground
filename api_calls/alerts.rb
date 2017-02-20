require_relative 'weather_underground_endpoint'

class CurrentConditions < WeatherUndergroundEndpoint
  def initialize
    super('alerts', 'data/alerts.json')
    p CurrentConditions
  end
end
