class CreateVeterinarians < ActiveRecord::Migration
  def change
    create_table :veterinarians do |t|
      t.references :address, index: true
      t.string :name
      t.string :lastname

      t.timestamps
    end
  end
end
