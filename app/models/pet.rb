class Pet < ActiveRecord::Base
  belongs_to :type
  belongs_to :breed
  belongs_to :owner
  has_many :pet_treatments
  has_and_belongs_to_many :losses
  has_and_belongs_to_many :treatments
  has_many :sales
end
