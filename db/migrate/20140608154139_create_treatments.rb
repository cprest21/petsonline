class CreateTreatments < ActiveRecord::Migration
  def change
    create_table :treatments do |t|
      t.references :veterinarian, index: true
      t.datetime :treatment_date

      t.timestamps
    end
  end
end
