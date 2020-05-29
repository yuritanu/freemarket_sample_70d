class ChangeDataPostalCodeToProfileaddresses < ActiveRecord::Migration[5.2]
  def change
    change_column :profileaddresses,:postal_code,:string
  end
end
