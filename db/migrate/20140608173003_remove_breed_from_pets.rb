class RemoveBreedFromPets < ActiveRecord::Migration
  def change
    remove_reference :pets, :breed, index: true
  end
end
