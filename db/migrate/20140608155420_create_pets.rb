class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.references :breed, index: true
      t.string :name
      t.references :owner, index: true
      t.datetime :birth_date
      t.string :colour
      t.boolean :sex
      t.boolean :sterilized
      t.boolean :available_to_breed
      t.boolean :deceased
      t.datetime :death_date, :value => nil

      t.timestamps
    end
  end
end
