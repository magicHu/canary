class ChangeStateTypeInOrders < ActiveRecord::Migration
  def change
    change_column :orders, :status, :string
  end
end
