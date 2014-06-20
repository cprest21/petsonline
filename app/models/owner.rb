class Owner < ActiveRecord::Base
  belongs_to :address
  belongs_to :user
  has_many :pets
end
