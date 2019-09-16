class ForecastSerializer

  def initialize(location)
    @location = location
  end

  def location_forecast
    darkskyservice = DarkskyService.new
    darkskyservice.forecast(@location)
  end
end
