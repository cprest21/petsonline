class AddColumnsToVeterinarian < ActiveRecord::Migration
  def change
    add_reference :veterinarians, :city, index: true
    add_column :veterinarians, :street, :string
    add_column :veterinarians, :street_no, :string
    add_column :veterinarians, :building, :string
    add_column :veterinarians, :floor, :string
    add_column :veterinarians, :office_no, :string
    add_column :veterinarians, :telephone, :string
  end
end
