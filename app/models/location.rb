class Location < ApplicationRecord

  def self.geocoded(query_location)
    geoservice = GeocodeService.new(query_location)
    geoservice.get_latitude_and_longitude
  end
end
