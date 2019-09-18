class RoadtripFacade

  def initialize(trip_points)
    @trip_points = trip_points
  end

  def expected_forecast
    # binding.pry
    origin_lat_and_long = Location.geocoded(@trip_points[:origin])
    destination_lat_and_long = Location.geocoded(@trip_points[:destination])
  end

  # private
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
