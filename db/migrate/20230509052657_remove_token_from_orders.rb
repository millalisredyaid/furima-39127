class RemoveTokenFromOrders < ActiveRecord::Migration[6.0]
  def change
    remove_column :orders, :token, :string
  end
end
