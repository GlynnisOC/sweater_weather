class Background
  attr_reader :id, :url

  def initialize(location_background)
    @id = location_background[:id]
    @url = location_background[:urls][:regular]
  end
end
