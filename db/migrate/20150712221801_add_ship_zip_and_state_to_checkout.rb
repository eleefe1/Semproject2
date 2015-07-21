class AddShipZipAndStateToCheckout < ActiveRecord::Migration
  def change
    add_column :checkouts, :shipzip, :integer
    add_column :checkouts, :shipstate, :string
  end
end
