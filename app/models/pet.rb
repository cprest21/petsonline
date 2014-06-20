class Pet < ActiveRecord::Base
  belongs_to :type
  belongs_to :owner
  has_many :pet_treatments
  has_many :pets_losses
  has_many :sales
end
