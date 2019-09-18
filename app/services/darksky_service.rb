class DarkskyService

  def forecast(location)
    lat = location[:lat]
    long = location[:lng]
    url = "/forecast/#{ENV['DARKSKY-API-KEY']}/#{lat},#{long}"
    get_json(url)
  end

  def get_future_forecast(trip_points, trip_duration)
    destination = Location.geocoded(trip_points[:destination])
    lat = destination[:lat]
    long = destination[:lng]
    time = future_time(trip_duration)
    url = "/forecast/#{ENV['DARKSKY-API-KEY']}/#{lat},#{long},#{time}"
    get_json(url)
  end

  def future_time(trip_duration)
    now = Time.now.to_i
    future_time = trip_duration[:value]
    now + future_time
  end

  private
  def connection
    @_connection ||= Faraday.new("https://api.darksky.net")
  end

  def get_json(url)
    response = connection.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end
