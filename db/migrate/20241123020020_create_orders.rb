class CreateOrders < ActiveRecord::Migration[7.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.date :order_date
      t.string :order_status
      t.decimal :total_price, precision: 10, scale: 2
      t.text :shipping_address
      t.string :payment_status

      t.timestamps
    end
  end
end
