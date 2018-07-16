class LocationsController < ApplicationController

  def new
  end

  def create
    @zip_code = params[:zip_code]

    response = OpenWeatherMap.get_weather_by_zip(@zip_code)

    @temp_k = response['main']['temp']
    @temp_c = @temp_k - 273.15

    @humidity = response['main']['humidity']

    @dew_point = @temp_c - ((100 - @humidity) / 5);
    
    response = "nope"
    response = "sorta"     if @dew_point > 12.7778 # 55F
    response = "a bit"     if @dew_point > 15.5556 # 60F
    response = "yeah"      if @dew_point > 18.3333 # 65F
    response = "very much" if @dew_point > 21.1111 # 70F
    
    @response = response
  end

end
