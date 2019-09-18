class GeocodeService

  def initialize(location)
    @location = location
  end

  def get_latitude_and_longitude
    address = @location.sub(',', '+')
    url = '/maps/api/geocode/json'
    params = {address: address, key: ENV['GOOGLE-API-KEY']}
    get_json(url, params)[:results][0][:geometry][:location]
  end

  private
  def connection
    @_connection ||= Faraday.new("https://maps.googleapis.com")
  end

  def get_json(url, params = {})
    response = connection.get(url, params)
    JSON.parse(response.body, symbolize_names: true)
  end
end
