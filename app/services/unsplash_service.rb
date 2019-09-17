class UnsplashService

  def background(location)
    url = '/search/photos'
    params = { client_id: ENV['UNSPLASH-API-KEY'], query: location }
    get_json(url, params)[:results][1][:urls][:regular]
  end

  private
  def connection
    @_connection ||= Faraday.new("https://api.unsplash.com")
  end

  def get_json(url, params)
    response = connection.get(url, params)
    JSON.parse(response.body, symbolize_names: true)
  end
end
