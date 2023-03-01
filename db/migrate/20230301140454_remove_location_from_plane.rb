class RemoveLocationFromPlane < ActiveRecord::Migration[7.0]
  def change
    remove_column :planes, :location, :string
  end
end
