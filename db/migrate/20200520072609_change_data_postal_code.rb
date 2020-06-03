class ChangeDataPostalCode < ActiveRecord::Migration[5.2]
  def change
    change_column :deliveryaddresses,:postal_code,:string
    change_column :deliveryaddresses,:phone_number,:string
  end
end
