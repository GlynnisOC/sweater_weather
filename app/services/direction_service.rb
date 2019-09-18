class DirectionService

  def get_drive_duration(trip_points)
    url = '/maps/api/directions/json'
    origin = trip_points[:origin]
    destination = trip_points[:destination]
    params = { origin: origin, destination: destination, key: ENV['GOOGLE-API-KEY'] }
    get_json(url, params)[:routes][0][:legs][0][:duration]
    #dont wittle down here but in facade instead to make code more reusable
  end

  private
  def connection
    @_connection ||= Faraday.new("https://maps.googleapis.com")
  end

  def get_json(url, params)
    response = connection.get(url, params)
    JSON.parse(response.body, symbolize_names: true)
  end
end
