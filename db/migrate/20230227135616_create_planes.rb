class CreatePlanes < ActiveRecord::Migration[7.0]
  def change
    create_table :planes do |t|
      t.string :name
      t.integer :seats
      t.integer :speed
      t.string :location
      t.integer :category, index: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
