require 'google_maps_service'

GoogleMapsService.configure do |config|
  config.key = ENV["GOOGLE_API_DISTANCE_KEY"]
  config.retry_timeout = 20
  config.queries_per_second = 10
end
