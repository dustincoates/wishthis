# == Schema Information
#
# Table name: items
#
#  id               :integer          not null, primary key
#  name             :string(255)
#  image_url        :string(255)
#  item_url         :string(255)
#  user_id          :integer
#  note             :text
#  corrected_status :boolean
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  price            :decimal(, )
#

class Item < ActiveRecord::Base
  belongs_to :user
end
