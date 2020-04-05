class RemoveSizeFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :size, :integer
  end
end
