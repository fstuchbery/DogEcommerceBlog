class CreateProducts < ActiveRecord::Migration[7.2]
  def change
    create_table :products do |t|
      t.string :product_name
      t.text :description
      t.decimal :price, precision: 10, scale: 2
      t.integer :category_id
      t.integer :stock_quantity

      t.timestamps
    end
  end
end
