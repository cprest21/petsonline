class Advertiser < ActiveRecord::Base
  belongs_to :address
  belongs_to :user
end
