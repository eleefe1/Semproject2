class AddZipAndStateToCheckout < ActiveRecord::Migration
  def change
    add_column :checkouts, :cardzip, :integer
    add_column :checkouts, :cardstate, :string
  end
end
