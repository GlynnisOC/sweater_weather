class Forecast
  attr_reader :id, :latitude, :longitude, :current_summary, :time,
              :feels_like, :current_temp, :humidity, :visibility, :uv_index,
              :daily_summary, :high, :low

  def initialize(location_forecast)
    @id = 0
    @latitude = location_forecast[:latitude]
    @longitude = location_forecast[:longitude]
    @current_summary = location_forecast[:currently][:summary]
    @time = location_forecast[:timezone]
    @feels_like = location_forecast[:currently][:apparentTemperature].to_i
    @current_temp = location_forecast[:currently][:temperature].to_i
    @humidity = location_forecast[:currently][:humidity]
    @visibility = location_forecast[:currently][:visibility]
    @uv_index = location_forecast[:currently][:uvIndex]
    @daily_summary = location_forecast[:daily]
    @high = location_forecast[:daily][:data][0][:temperatureHigh].to_i
    @low = location_forecast[:daily][:data][0][:temperatureLow].to_i
  end
end
