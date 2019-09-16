class Daily
  attr_reader :time, :summary, :url

  def initialize(attrs = {})
    @time = attrs[:time]
    @summary = attrs[:summary]
    @url = nil
  end
end
