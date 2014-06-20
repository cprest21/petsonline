class Type < ActiveRecord::Base
	has_many :breeds
	has_many :pets
end
