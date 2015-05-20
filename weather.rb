require 'yahoo_weatherman'

def get_location(location)
  client = Weatherman::Client.new
  client.lookup_by_location(location)
end

puts "Enter your zip code:"
zip = gets.chomp
weather = get_location(zip)

today = Time.now.strftime('%w').to_i

weather.forecasts.each do |forecast|
  
  day = forecast['date']
  
  weekday = day.strftime('%w').to_i
  
  if weekday == today
    dayName = 'Today'
    elsif weekday == today + 1
    dayName = 'Tomorrow'
    else
    dayName = day.strftime('%A')
  end
  
  # Convert from Celsius to Fahrenheit
  low_f = forecast['low'] * 9 / 5 + 32
  high_f = forecast['high'] * 9 / 5 + 32
  
  puts dayName + ' is going to be ' + forecast['text'].downcase + ' with a low of ' + low_f.to_s + ' and a high of ' + high_f.to_s + '.'
  
end