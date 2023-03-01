class AddCoordinatesToPlanes < ActiveRecord::Migration[7.0]
  def change
    add_column :planes, :latitude, :float
    add_column :planes, :longitude, :float
  end
end
