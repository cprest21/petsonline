class Treatment < ActiveRecord::Base
  belongs_to :veterinarian
  #has_many :vaccination_types
  #has_many :dewormings
  #has_many :operations
  has_and_belongs_to_many :pets
end
