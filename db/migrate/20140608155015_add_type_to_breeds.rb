class AddTypeToBreeds < ActiveRecord::Migration
  def change
    add_reference :breeds, :type, index: true
  end
end
