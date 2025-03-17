class SpotsController < ApplicationController
  def index
    @spots = Spot.all
  end

  def show
    @spot = Spot.find(params[:id])
  end

  def new
    @spot = Spot.new
  end

  def create
    # address = create_address
    # geocode = Geocoder.search(address).first.coordinates
    # @spot = Spot.new(spot_params.merge(latitude: geocode[0], longitude: geocode[1]))
    # モデルの方の「after_validation :geocode」で勝手に緯度・経度をセットしてくれる。おそらくspot.addressメソッドの戻り値を元に算出していると思われる。
    @spot = Spot.new(spot_params)
    if @spot.save
      redirect_to spots_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def spot_params
    params.require(:spot).permit(:name, :prefecture, :city, :town)
  end

  def create_address
    [params[:spot][:prefecture], params[:spot][:city], params[:spot][:town]].join
  end
end
