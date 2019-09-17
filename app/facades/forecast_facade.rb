class ForecastFacade

  def initialize(location)
    @location = location
  end

  def forecast
    @_forecast ||= Forecast.new(location_forecast)
  end


  private
  def service
    @_service ||= DarkskyService.new
  end

  def location_forecast
    @_location_forecast ||= service.forecast(@location)
  end
end
