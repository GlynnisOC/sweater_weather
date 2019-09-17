class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :latitude, :longitude, :current_summary, :time,
              :feels_like, :current_temp, :humidity, :visibility, :uv_index,
              :daily_summary, :high, :low

end
