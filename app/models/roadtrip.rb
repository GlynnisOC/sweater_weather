class Roadtrip
  attr_reader :id, :forecast, :temperature, :travel_time

  def initialize(forecast, temperature, travel_time)
    @forecast = forecast
    @temperature = temperature
    @travel_time = travel_time
  end
end
