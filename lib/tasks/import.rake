require 'csv'
require 'uri'
require 'net/http'
require 'json'
require 'geocoder'


namespace :import do
  desc "Import the Places CSV data into the database"
  task places: :environment do
    file = Rails.root.join('resources', 'sportplaces.csv')
    i = 0
    CSV.foreach(file) do |row|
      # Loop over the data and skip the header row
      if i > 0
        name, lon, lat, tag0, tag1, tag2, tag3 = row
        tags = [tag0, tag1, tag2, tag3]

        # Override the array with the Object references.
        tags.map! {|item| Tag.find_by(keyword: item)}
        # Remove blank strings
        tags.reject!(&:blank?)

        address, zip, country = address_lookup(lat,lon)
        place = Place.new(name: name, long: lon, lat: lat, zip: zip, address: address, country: country, tags: tags) if place == nil
        place.save
      end
      i += 1
    end
  end

  desc "Import the Tags CSV data into the databases"
  task tags: :environment do
    file = Rails.root.join('resources', 'sportplaces.csv')
    i = 0
    CSV.foreach(file, { headers: false }) do |row|
      # Loop over the data and skip the header row
      if i > 0
        name, lon, lat, tag0, tag1, tag2, tag3 = row
        [tag0, tag1, tag2, tag3].each do |n|
          unless n.blank?
            # Create a new tag for each unique one found
            Tag.find_or_create_by(keyword: n)
          end
        end
      end
      i += 1
    end
    #puts tags
  end

  task api: :environment do
    #uri = URI.parse('https://maps.googleapis.com/maps/api/geocode/json?latlng=45.552874,-73.636959&key=AIzaSyAmd7W1Q6vrrZ3AYeE4HbTCTVYFhSM1lxg')
    #res = Net::HTTP.get(uri)
    #data = JSON.parse(res)
    #res = HTTParty.get('https://maps.googleapis.com/maps/api/geocode/json?latlng=45.552874,-73.636959&key=AIzaSyAmd7W1Q6vrrZ3AYeE4HbTCTVYFhSM1lxg')
    results = Geocoder.search([45.552526,-73.63639])
    puts results.first.inspect
  end

end

# Reverse geocode function
def address_lookup(lat, long)
  results = Geocoder.search([lat, long])
  data = results.first

  #Concatenate the adress
  address = "#{data.street_number} #{data.route}"

  #Return our data as : address, zip, country
  return [address, data.postal_code, data.country]
end