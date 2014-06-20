class CreatePetTreatments < ActiveRecord::Migration
  def change
    create_table :pet_treatments do |t|
      t.integer :medical_history_no
      t.references :pet, index: true
      t.references :treatment, index: true

      t.timestamps
    end
  end
end
