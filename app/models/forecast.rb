class Forecast
  attr_reader :id, :latitude, :longitude, :current_summary, :hourly_summary, :daily_summary

  def initialize(location_forecast)
    @latitude = location_forecast[:latitude]
    @longitude = location_forecast[:longitude]
    @current_summary = current_forecast(location_forecast)
    @hourly_summary = location_forecast[:hourly]
    @daily_summary = location_forecast[:daily]
  end

  def current_forecast(location_forecast)
    {
    time: Time.at(location_forecast[:currently][:time]).to_time,
    summary: location_forecast[:currently][:summary],
    image: location_forecast[:currently][:icon],
    temperature: location_forecast[:currently][:temperature],
    feels_like: location_forecast[:currently][:apparentTemperature],
    humidity: location_forecast[:currently][:humidity],
    wind: location_forecast[:currently][:windSpeed],
    uv_index: location_forecast[:currently][:uvIndex],
    visibility: location_forecast[:currently][:visibility]
    }
  end
end
