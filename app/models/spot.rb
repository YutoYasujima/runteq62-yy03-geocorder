class Spot < ApplicationRecord
  geocoded_by :address
  after_validation :geocode

  def address
    [prefecture, city, town].compact.join(', ')
  end
end
