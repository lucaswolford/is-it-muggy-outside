class OpenWeatherMap
  include HTTParty
  base_uri 'api.openweathermap.org'
  default_params :APPID => ENV['OPEN_WEATHER_API_KEY']

  def self.get_weather_by_zip(zip)
    get("/data/2.5/weather?zip=#{zip},us")
  end
end