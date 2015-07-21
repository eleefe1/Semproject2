# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  first_name      :string
#  last_name       :string
#  email           :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  admin           :boolean          default(FALSE)
#

class User < ActiveRecord::Base

  has_secure_password

  has_many :carts
  has_one :checkout

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :email

  validates_format_of :email, with: /[a-zA-z0-9]+@[a-zA-Z0-9]+\.[a-zA-z0-9]+/

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
