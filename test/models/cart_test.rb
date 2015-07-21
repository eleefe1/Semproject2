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

require 'test_helper'

class CartTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
