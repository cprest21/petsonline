class AddDetailsToTreatments < ActiveRecord::Migration
  def change
    add_column :treatments, :details, :text
  end
end
