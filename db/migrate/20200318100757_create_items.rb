class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :version, null: false
      t.string :brand
      t.string :condition, null: false
      t.string :delivery_select, null: false
      t.string :delivery_method_include_fee, null: false
      t.string :delivery_method_COD, null: false
      t.string :supplier_region, null: false
      t.string :delivery_date, null: false
      t.integer :saler_id
      t.integer :buyer_id
      t.integer :category_id, foreign_key: true
      t.integer :size, null: false
      t.timestamps
    end
  end
end
