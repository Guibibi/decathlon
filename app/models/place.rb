class Place < ApplicationRecord
    has_many :place_tags
    has_many :tags, through: :place_tags
    validates :name, presence: true
    validates :lat, presence: true
    validates :long, presence: true
    validates :zip, presence: true
    validates :address, presence: true
    validates :country, presence: true
end
