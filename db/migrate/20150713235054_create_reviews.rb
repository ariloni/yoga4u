class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :by_user, index: true, class_name: "User"
      t.references :for_user, index: true, class_name: "User"
      t.integer :rating
      t.string :title
      t.text :body

      t.timestamps null: false
    end
  end
end
