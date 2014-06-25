class Breed < ActiveRecord::Base
	belongs_to :type
	has_many :pets
end
