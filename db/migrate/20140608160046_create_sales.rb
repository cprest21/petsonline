class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.references :pet, index: true
      t.float :price
      t.boolean :sold
      t.datetime :date_sold
      t.text :details

      t.timestamps
    end
  end
end
