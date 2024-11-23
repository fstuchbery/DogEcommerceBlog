class CreatePayments < ActiveRecord::Migration[7.2]
  def change
    create_table :payments do |t|
      t.integer :order_id
      t.date :payment_date
      t.decimal :payment_amount, precision: 10, scale: 2
      t.string :payment_method
      t.string :payment_status

      t.timestamps
    end
  end
end
