class CreateDewormings < ActiveRecord::Migration
  def change
    create_table :dewormings do |t|
      t.string :name
      t.references :treatment, index: true

      t.timestamps
    end
  end
end
