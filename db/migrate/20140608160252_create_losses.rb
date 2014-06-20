class CreateLosses < ActiveRecord::Migration
  def change
    create_table :losses do |t|
      t.boolean :lost
      t.string :finder_name
      t.text :finder_contact_details
      t.datetime :date_lost
      t.string :place_lost
      t.datetime :date_found
      t.string :place_found

      t.timestamps
    end
  end
end
