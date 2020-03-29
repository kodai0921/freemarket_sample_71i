class AddShipToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :ship_method_id, :integer
  end
end
