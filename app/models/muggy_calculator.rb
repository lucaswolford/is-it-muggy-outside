class MuggyCalculator

  def self.get_muggy_scale_for_zip(zip_code)
    response = OpenWeatherMap.get_weather_by_zip(zip_code)

    return nil if response['main'].nil?

    temp_k = response['main']['temp'] || 0
    temp_c = temp_k - 273.15

    humidity = response['main']['humidity'] || 0

    dew_point = temp_c - ((100 - humidity) / 5);

    muggy_scale = 0
    muggy_scale = 1 if dew_point > 12.7778 # 55F
    muggy_scale = 2 if dew_point > 15.5556 # 60F
    muggy_scale = 3 if dew_point > 18.3333 # 65F
    muggy_scale = 4 if dew_point > 21.1111 # 70F
  end
end