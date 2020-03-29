class RemoveAddressInAddressinfos < ActiveRecord::Migration[5.2]
  def change
    remove_column :addressinfos, :first_name, :string
    remove_column :addressinfos, :last_name, :string
    remove_column :addressinfos, :first_name_kana, :string
    remove_column :addressinfos, :last_name_kana, :string
  end
end
