class Advertisement < ActiveRecord::Base
  belongs_to :user
  
  #def timeconv
  #	updated_at = Time.zone.local
  #	updated_at
  #end
end
