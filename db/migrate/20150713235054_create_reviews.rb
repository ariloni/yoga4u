class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :for_user, index: true, foreign_key: true
      t.references :by_user, index: true, foreign_key: true
      t.integer :rating
      t.string :title
      t.text :body

      t.timestamps null: false
    end
  end
end
