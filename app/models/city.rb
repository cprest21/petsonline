class City < ActiveRecord::Base
  belongs_to :province
  has_many :addresses
  has_many :veterinarians
end
