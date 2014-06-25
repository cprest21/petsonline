class RenameTablePetTreatments < ActiveRecord::Migration
  def change
  	rename_table :pet_treatments, :pets_treatments
  end
end