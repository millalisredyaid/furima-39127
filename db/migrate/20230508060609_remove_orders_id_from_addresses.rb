class RemoveOrdersIdFromAddresses < ActiveRecord::Migration[6.0]
  def change
    remove_column :addresses, :orders_id
  end
end
