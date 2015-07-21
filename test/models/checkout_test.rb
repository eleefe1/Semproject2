# == Schema Information
#
# Table name: checkouts
#
#  id         :integer          not null, primary key
#  shipname   :string
#  shipstreet :string
#  shipcity   :string
#  billname   :string
#  billstreet :string
#  billcity   :string
#  cardnumber :string
#  cardmonth  :integer
#  cardyear   :integer
#  cardcvv    :integer
#  cart_id    :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  cardtype   :string
#  cardzip    :integer
#  cardstate  :string
#  shipzip    :integer
#  shipstate  :string
#  saved      :boolean
#

require 'test_helper'

class CheckoutTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
