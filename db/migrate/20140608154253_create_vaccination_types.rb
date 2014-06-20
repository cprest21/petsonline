class CreateVaccinationTypes < ActiveRecord::Migration
  def change
    create_table :vaccination_types do |t|
      t.string :name
      t.references :treatment, index: true

      t.timestamps
    end
  end
end
