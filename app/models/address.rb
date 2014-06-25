class Address < ActiveRecord::Base
  belongs_to :city
  has_many :owners
  has_many :advertisers
end
