class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :longitude, :float
    add_column :users, :latitude, :float
    add_column :users, :zipcode, :integer
    add_column :users, :gmaps, :boolean
  end
end
