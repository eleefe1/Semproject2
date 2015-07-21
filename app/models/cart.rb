# == Schema Information
#
# Table name: carts
#
#  id            :integer          not null, primary key
#  subtotal      :decimal(10, 2)
#  status        :boolean
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_id       :integer
#  cart_items_id :integer
#

class Cart < ActiveRecord::Base

  belongs_to :user

  has_many :cart_items
  has_one :checkout

  def update_subtotal
    subtotal = 0

    self.cart_items.each do |cart_item|
      subtotal = subtotal + cart_item.product.price * cart_item.quantity
    end

    self.subtotal = subtotal
    self.save
  end

end
