class RemoveDetailsFromTreatments < ActiveRecord::Migration
  def change
    remove_column :treatments, :details, :string
  end
end
