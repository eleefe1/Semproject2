class AddSavedToCheckouts < ActiveRecord::Migration
  def change
    add_column :checkouts, :saved, :boolean
  end
end
