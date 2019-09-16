class GeocodeService

  def initialize(location)
    @location = location.split(/, ?/)
  end

  def get_coordinates
    params = {address: @location}
    binding.pry
    get_json(params)
    JSON.parse(response.body, symbolize_names: true)
  end

  private
  def connection
    @_connection ||= Faraday.new("https://maps.googleapis.com/maps/api/geocode/json", params:{key: ENV['GEOCODE-API-KEY']})
  end

  def get_json(params = {})
    response = connection.get(params)
    JSON.parse(response.body, symbolize_names: true)
  end
end
