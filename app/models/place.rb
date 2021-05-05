class Place < ApplicationRecord
    require 'csv'

    has_and_belongs_to_many :tags

    def self.my_import(file)
        entries = []
        CSV.foreach(file.path, headers: true) do |row|
            entries << Place.new(row.to_h)
        end
        User.import entries, recursive: true
    end
end
