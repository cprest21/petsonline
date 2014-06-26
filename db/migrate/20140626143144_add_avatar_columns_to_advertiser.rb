class AddAvatarColumnsToAdvertiser < ActiveRecord::Migration
  def change
  	add_attachment :advertisers, :avatar
  end
end
