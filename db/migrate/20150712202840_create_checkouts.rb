class CreateCheckouts < ActiveRecord::Migration
  def change
    create_table :checkouts do |t|
      t.string :shipname
      t.string :shipstreet
      t.string :shipcity
      t.string :billname
      t.string :billstreet
      t.string :billcity
      t.string :cardnumber
      t.integer :cardmonth
      t.integer :cardyear
      t.integer :cardcvv

      t.references :cart, null: false
      t.references :user, null: false

      t.timestamps null: false
    end

    add_foreign_key :checkouts, :users
    add_foreign_key :checkouts, :carts
  end
end
