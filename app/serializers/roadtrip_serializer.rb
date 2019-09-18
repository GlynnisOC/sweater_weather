class RoadtripSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :forecast, :temperature, :travel_time

end
