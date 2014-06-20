class CreatePetsLosses < ActiveRecord::Migration
  def change
    create_table :pets_losses do |t|
      t.integer :loss_history_no
      t.references :pet, index: true
      t.references :loss, index: true

      t.timestamps
    end
  end
end
