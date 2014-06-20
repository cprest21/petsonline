class PetsLoss < ActiveRecord::Base
  belongs_to :pet
  belongs_to :loss
end
