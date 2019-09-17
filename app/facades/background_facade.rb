class BackgroundFacade

  def initialize(location)
    @location = location
  end

  def background
    @_background ||= Background.new(location_background)
  end

  private

  def service
    @_service ||= UnsplashService.new
  end

  def location_background
    @_location_background ||= service.background(@location)
  end
end
