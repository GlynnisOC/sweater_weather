class Location < ApplicationRecord

  def self.geocoded(query_location)
    geoservice = GeocodeService.new(query_location)
    geoservice.get_coordinates
  end
end
