class RemoveMedicalHistoryNoFromPetsTreatments < ActiveRecord::Migration
  def change
    remove_column :pets_treatments, :medical_history_no, :integer
  end
end
