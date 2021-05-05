class CreatePlacesTagsJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_join_table :places, :tags
  end
end
