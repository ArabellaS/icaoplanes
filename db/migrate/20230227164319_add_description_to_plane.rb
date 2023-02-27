class AddDescriptionToPlane < ActiveRecord::Migration[7.0]
  def change
    add_column :planes, :description, :string
  end
end
