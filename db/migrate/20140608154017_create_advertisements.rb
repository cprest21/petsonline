class CreateAdvertisements < ActiveRecord::Migration
  def change
    create_table :advertisements do |t|
      t.references :user, index: true
      t.text :details
      t.datetime :placement_date

      t.timestamps
    end
  end
end
