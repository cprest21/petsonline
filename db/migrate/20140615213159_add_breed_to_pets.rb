class AddBreedToPets < ActiveRecord::Migration
  def change
    add_reference :pets, :breed, index: true
  end
end
