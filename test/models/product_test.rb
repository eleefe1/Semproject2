# == Schema Information
#
# Table name: products
#
#  id            :integer          not null, primary key
#  title         :string
#  description   :text
#  price         :decimal(10, 2)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  cart_items_id :integer
#

require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
