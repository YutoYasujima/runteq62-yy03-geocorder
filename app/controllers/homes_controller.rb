class HomesController < ApplicationController
  def index
    @geocoding = Geocoder.search("東京駅")
    @reverse = Geocoder.search( [35.67779625, 139.76448355000002])
    @ip_address = Geocoder.search("172.56.21.89")
  end
end
