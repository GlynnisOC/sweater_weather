class GiphyService

  def gifs(forecast)
    conditions = forecast[:daily][:data]
    day_objects = conditions.map do |daily|
      Daily.new(daily)
    end
    q = day_objects.map do |day|
      day.summary
    end
    binding.pry
    url = "/v1/gifs/search"
    params = { api_key: ENV['GIPHY-API-KEY'], q: q } 
    get_json(url, params)
  end

  private
  def connection
    @_connection ||= Faraday.new("http://api.giphy.com")
  end

  def get_json(url, params)
    response = connection.get(url, params)
    JSON.parse(response.body, symbolize_names: true)
  end
end
