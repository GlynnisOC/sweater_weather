class GifsSerializer

  def initialize(forecast)
    @forecast = forecast
  end

  def daily_gifs
    giphy_service = GiphyService.new
    giphy_service.gifs(@forecast)
  end
end
