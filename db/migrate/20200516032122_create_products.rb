class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|

      t.string       :name,                null: false
      t.text         :explanation,         null: false
      t.references   :category,            null: false, foreign_key: true
      t.integer      :brand
      t.integer      :product_status,      null: false
      t.integer      :delivery_cost,       null: false
      t.integer      :shipping_origin,     null: false
      t.integer      :delivery_day,        null: false
      t.integer      :price,               null: false
      t.references   :user,                null: false, foreign_key: true
      t.integer      :buyer 
      t.timestamps
    end
  end
end
