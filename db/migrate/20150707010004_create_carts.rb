class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.decimal :subtotal, precision: 10, scale: 2
      t.boolean :status

      t.references :user

      t.timestamps null: false
    end

    add_foreign_key :carts, :users
  end
end
