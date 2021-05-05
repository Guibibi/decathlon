class CreatePlaces < ActiveRecord::Migration[6.1]
  def change
    create_table :places do |t|
      t.float :lat
      t.float :long
      t.string :name
      t.string :zip
      t.string :address
      t.string :country

      t.timestamps
    end
  end
end
