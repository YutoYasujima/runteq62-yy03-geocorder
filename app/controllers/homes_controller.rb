class HomesController < ApplicationController
  def index
    # 狭山市駅の座標取得
    @geocoding = Geocoder.search("狭山市駅")
    # 座標から住所取得
    @reverse = Geocoder.search([35.8356065, 139.3868721])
    # IPアドレスから取得
    @ip_address = Geocoder.search("172.56.21.89")
    # 狭山市駅から10km圏内のSpotレコード取得
    @nears = Spot.near('狭山市駅', 10, units: :km);
  end
end
