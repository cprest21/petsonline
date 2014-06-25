class RenameTablePetsLosses < ActiveRecord::Migration
  def change
  	rename_table :pets_losses, :losses_pets
  end
end
