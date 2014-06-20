class Treatment < ActiveRecord::Base
  belongs_to :veterinarian
  has_many :vaccination_types
  has_many :dewormings
  has_many :operations
end
