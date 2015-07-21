class ChangeCartAndUserToAllowNullCheckout < ActiveRecord::Migration
  def change
    change_column :checkouts, :user_id, :integer, :null => true
    change_column :checkouts, :cart_id, :integer, :null => true
  end
end
