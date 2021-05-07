require "test_helper"

class PlaceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not save place with missing argument" do
    place = Place.new
    assert !place.save
  end

  test "should save place" do
  place = Place.new(name: 'Parc Jean', long: 46.23123, lat: -73.234234, zip: "H7L5H6", address: "223 Rue de la Gauche", country: "Canada")
    assert place.save
  end
end
