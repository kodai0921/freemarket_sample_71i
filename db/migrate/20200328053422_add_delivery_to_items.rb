class AddDeliveryToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :delivery_date_id, :integer
  end
end
