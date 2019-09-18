class RoadtripFacade

  def initialize(trip_points)
    @trip_points = trip_points
  end

  def expected_forecast
    # binding.pry
    trip_duration

  end

  # def trip_points_lat_and_long
  #   origin = Location.geocoded(@trip_points[:origin])
  #   destination = Location.geocoded(@trip_points[:destination])
  # end

  def trip_duration
    @_trip_duration ||= dir_service.get_drive_duration(@trip_points)
  end

  private
  def ds_service
    @_ds_service ||= DarkskyService.new
  end

  def geo_service
    @_geo_service ||= GeocodeService.new
  end

  def dir_service
    @_dir_service ||= DirectionService.new
  end
end
