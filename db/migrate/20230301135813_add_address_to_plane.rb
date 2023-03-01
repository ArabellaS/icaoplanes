class AddAddressToPlane < ActiveRecord::Migration[7.0]
  def change
    add_column :planes, :address, :string
  end
end
