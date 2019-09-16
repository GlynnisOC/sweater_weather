class GiphyService

  def gifs(forecast)
    conditions = forecast[:daily][:data]
    day_objects = conditions.map do |daily|
      Daily.new(daily)
    end
    all_summaries = day_objects.map { |day| day.summary }
    all_gif_urls = []
    5.times do
      q = all_summaries.sample
      url = "/v1/gifs/search"
      params = { api_key: ENV['GIPHY-API-KEY'], q: q }
      one_times_gif_url = get_json(url, params)[:data][0][:url]
      all_gif_urls << one_times_gif_url
    end
    binding.pry
    all_gif_urls
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
