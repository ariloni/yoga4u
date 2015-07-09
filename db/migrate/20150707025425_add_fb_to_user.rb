class AddFbToUser < ActiveRecord::Migration
  def change
    add_column :users, :url, :string
    add_column :users, :location, :string
  end
end
