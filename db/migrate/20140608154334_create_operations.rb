class CreateOperations < ActiveRecord::Migration
  def change
    create_table :operations do |t|
      t.string :name
      t.references :treatment, index: true

      t.timestamps
    end
  end
end
