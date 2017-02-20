require_relative 'api_calls/ten_day_forecast'
require_relative 'api_calls/current_conditions'

def get_city_state_or_zip(location)
  match = /([^,]+), (\w{2})/.match(location)

  if match.nil?
    location
  else
    "#{match[2]}/#{match[1].gsub(' ', '_')}"
  end
end

def main
  puts 'Welcome to your weather. Please input your location:'

  location = get_city_state_or_zip(gets.chomp)

  ten_day_forecast = TenDayForecast.new

  current_conditions = CurrentConditions.new

  puts 'Ten Day Forecast Keys:'
  puts ten_day_forecast.get(location).keys
  weather = ten_day_forecast.get(location)
  puts  '/n Forecast Keys:'
  puts weather['forecast']['simpleforecast'].keys

  puts 'Current Conditions Keys:'
  puts current_conditions.get(location).keys
end

main if __FILE__ == $PROGRAM_NAME
