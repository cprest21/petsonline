class Veterinarian < ActiveRecord::Base
  #belongs_to :address
  has_many :treatments
  belongs_to :city

  def name_with_lastname
    "#{name} #{lastname}"
  end

end
