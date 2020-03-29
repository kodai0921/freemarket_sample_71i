class AddZipcodeToAddressinfos < ActiveRecord::Migration[5.2]
  def change
    add_column :addressinfos, :zipcode, :integer
  end
end
