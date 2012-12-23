# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string(255)
#  password_digest :string(255)
#  first_name      :string(255)
#  last_name       :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  email           :string(255)
#  user_type       :string(255)
#  slug            :string(255)
#

class User < ActiveRecord::Base
  has_many :items
  has_secure_password

  extend FriendlyId
  friendly_id :username, use: [:slugged, :history]

  validates :username, :email, :first_name, :presence => true
  validates :username, :uniqueness => true
end
