class RoadtripFacade

  def initialize(trip_points)
    @trip_points = trip_points
  end

  def expected_forecast
    forecast_summary = future_forecast[:currently][:summary]
    temperature = future_forecast[:currently][:temperature]
    Roadtrip.new(forecast_summary, temperature, trip_duration[:text])
  end

  def future_forecast
    @_future_forecast ||= ds_service.get_future_forecast(@trip_points, trip_duration)
  end

  def trip_duration
    @_trip_duration ||= dir_service.get_drive_duration(@trip_points)
  end

  private
  def ds_service
    @_ds_service ||= DarkskyService.new
  end

  def dir_service
    @_dir_service ||= DirectionService.new
  end
end
