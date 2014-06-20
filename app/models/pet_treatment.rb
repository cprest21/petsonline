class PetTreatment < ActiveRecord::Base
  belongs_to :pet
  belongs_to :treatment
end
