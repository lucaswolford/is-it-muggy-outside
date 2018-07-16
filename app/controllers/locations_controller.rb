class LocationsController < ApplicationController

  def index
    redirect_to action: :new
  end

  def new
  end

  def create
    zip_code = params[:zip_code]

    if zip_code.size == 5 && zip_code !~ /\D/
      muggy_scale = MuggyCalculator.get_muggy_scale_for_zip(zip_code)
      set_response_for_scale(muggy_scale)
    else
      @response = "Please enter a 5 digit zip code"
    end
  end

  private

  def set_response_for_scale(muggy_scale)
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
    else
      response = "I was unable to find that location"
    end
    
    @response = response
    @color_class = color_class
  end

end
