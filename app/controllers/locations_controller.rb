class LocationsController < ApplicationController

  def index
    redirect_to action: :new
  end

  def new
  end

  def create
    @zip_code = params[:zip_code]

    response = OpenWeatherMap.get_weather_by_zip(@zip_code)

    @temp_k = response['main']['temp']
    @temp_c = @temp_k - 273.15

    @humidity = response['main']['humidity']

    @dew_point = @temp_c - ((100 - @humidity) / 5);

    muggy_scale = 0
    muggy_scale = 1 if @dew_point > 12.7778 # 55F
    muggy_scale = 2 if @dew_point > 15.5556 # 60F
    muggy_scale = 3 if @dew_point > 18.3333 # 65F
    muggy_scale = 4 if @dew_point > 21.1111 # 70F

    case muggy_scale
    when 4
      response = "Very Much So"
      color_class = "divine-intervention"
    when 3
      response = "Yeah"
      color_class = "galactic-cool"
    when 2
      response = "A Bit"
      color_class = "fair-haven"
    when 1
      response = "Sort of"
      color_class = "smarty-pants"
    when 0
      response = "Nope"
      color_class = "the-jakes-on-him"
    end
    
    @response = response
    @color_class = color_class
  end

end
