class AddCartItemsRefToCart < ActiveRecord::Migration
  def change
    add_column :carts, :cart_items_id, :integer
  end
end
