class CreatePays < ActiveRecord::Migration[5.2]
  def change
    create_table :pays do |t|
      t.timestamps
      t.integer :card_number, null: false
      t.integer :month, null: false
      t.integer :day, null: false
      t.integer :security_code, null: false
      t.integer :user_id, foreign_key: true
    end
  end
end
