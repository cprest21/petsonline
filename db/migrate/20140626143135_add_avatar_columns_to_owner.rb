class AddAvatarColumnsToOwner < ActiveRecord::Migration
  def change
  	add_attachment :owners, :avatar
  end
end
