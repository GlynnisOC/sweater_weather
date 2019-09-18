class DirectionService

  def initialize(origin, destination)
    @origin = origin
    @destination = destination
  end

  def get_drive_duration
    url = '/maps/api/directions/json'
    params = {origin: @origin, destination: @destination, key: ENV['GOOGLE-API-KEY']}
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
