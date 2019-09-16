class DarkskyService

  def forecast(location)
    lat = location[:lat]
    long = location[:lng]
    url = "/forecast/#{ENV['DARKSKY-API-KEY']}/#{lat},#{long}"
    get_json(url)
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
