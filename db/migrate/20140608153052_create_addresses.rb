class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.references :city, index: true
      t.string :street
      t.string :street_no
      t.string :apartment_no
      t.string :floor
      t.string :telephone
      t.string :office_no
      t.string :building

      t.timestamps
    end
  end
end
