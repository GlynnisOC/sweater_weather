class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :latitude, :longitude, :current_summary, :hourly_summary, :daily_summary

end
