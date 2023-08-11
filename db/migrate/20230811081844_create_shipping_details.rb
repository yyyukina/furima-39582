class CreateShippingDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :shipping_details do |t|
      t.string      :postal_code,   null: false
      t.integer     :region_id,     null: false,  foreign_key: true
      t.string      :city,          null: false
      t.string      :address_line,  null: false
      t.string      :building_name
      t.string      :phone_number,  null: false
      t.references  :order,         null: false,  foreign_key: true
      t.timestamps
    end
  end
end
