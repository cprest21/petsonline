class CreateOwners < ActiveRecord::Migration
  def change
    create_table :owners do |t|
      t.references :address, index: true
      #t.references :user, index: true
      t.string :name
      t.string :lastname

      t.timestamps
    end
  end
end
