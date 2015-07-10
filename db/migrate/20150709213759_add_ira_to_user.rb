class AddIraToUser < ActiveRecord::Migration
  def change
  	add_column :users, :student, :boolean 
  	add_column :users, :both, :boolean 
  end
end
