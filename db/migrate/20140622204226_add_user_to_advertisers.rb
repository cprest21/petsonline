class AddUserToAdvertisers < ActiveRecord::Migration
  def change
    add_reference :advertisers, :user, index: true
  end
end
