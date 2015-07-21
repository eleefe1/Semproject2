class AddCartItemsRefToProduct < ActiveRecord::Migration
  def change
    add_column :products, :cart_items_id, :integer
  end
end
