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

class Checkout < ActiveRecord::Base

  belongs_to :user
  belongs_to :cart

  validates_format_of :cardnumber, with: /[0-9]{4,}/
  validates_format_of :cardcvv, with: /[0-9]{3}/
end
