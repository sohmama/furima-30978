class CreateDeliveryDestinations < ActiveRecord::Migration[6.0]
  def change
    create_table :delivery_destinations do |t|
      t.references :item_purchase, foreign_key:true
      t.string :postal_code,       null:false
      t.integer :prefecture,       null:false
      t.string :municipality,      null:false
      t.string :address,           null:false 
      t.string :building
      t.string :tel ,              null:false
      t.timestamps
    end
  end
end
