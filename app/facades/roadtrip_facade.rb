class RoadtripFacade

  def initialize(trip_points)
    @trip_points = trip_points
  end

  def expected_forecast
    binding.pry
    origin_lat_and_long = Location.geocoded(@trip_points[:origin])
    destination_lat_and_long = Location.geocoded(@trip_points[:destination])
  end
end
