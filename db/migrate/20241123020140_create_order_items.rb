class CreateOrderItems < ActiveRecord::Migration[7.2]
  def change
    create_table :order_items do |t|
      t.integer :order_id
      t.integer :product_id
      t.integer :quantity
      t.decimal :price_per_unit, precision: 10, scale: 2
      t.decimal :total_price, precision: 10, scale: 2

      t.timestamps
    end
  end
end
