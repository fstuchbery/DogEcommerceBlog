class AddProvinceToCustomers < ActiveRecord::Migration[7.2]
  def change
    add_column :customers, :province, :string, limit: 2
  end
end
