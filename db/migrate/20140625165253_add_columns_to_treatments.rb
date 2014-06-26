class AddColumnsToTreatments < ActiveRecord::Migration
  def change
    add_column :treatments, :deworming, :boolean
    add_column :treatments, :operation, :boolean
    add_column :treatments, :vaccination, :boolean
    add_column :treatments, :details, :string
  end
end
