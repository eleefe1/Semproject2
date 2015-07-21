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

class Product < ActiveRecord::Base

  has_many :cart_items

  validates_presence_of :title
  validates_presence_of :description
  validates_presence_of :price

end
