class AddVistoToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :visto, :boolean
  end
end
