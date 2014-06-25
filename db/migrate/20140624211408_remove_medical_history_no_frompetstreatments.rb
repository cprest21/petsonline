class RemoveMedicalHistoryNoFrompetstreatments < ActiveRecord::Migration
  def change
  	remove_column :pets_treatments, :medical_history_no, index: true
  end
end
