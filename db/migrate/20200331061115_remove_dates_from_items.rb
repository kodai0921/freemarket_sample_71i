class RemoveDatesFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :delivery_method_include_fee, :string
    remove_column :items, :delivery_method_COD, :string
    remove_column :items, :supplier_region, :string
    remove_column :items, :delivery_date, :string
  end
end
