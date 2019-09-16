class GiphyService

  def initialize
    @forecast = forecast
  end

  def gifs
    binding.pry
  end

  private
  def connection
    @_connection ||= Faraday.new("http://api.giphy.com/v1/gifs/search")
  end

  def get_json(url, params)
    response = connection.get(url, params)
    JSON.parse(response.body, symbolize_names: true)
  end
end
