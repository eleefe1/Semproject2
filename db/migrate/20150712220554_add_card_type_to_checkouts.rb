class AddCardTypeToCheckouts < ActiveRecord::Migration
  def change
    add_column :checkouts, :cardtype, :string
  end
end
