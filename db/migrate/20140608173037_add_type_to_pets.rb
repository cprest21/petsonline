class AddTypeToPets < ActiveRecord::Migration
  def change
    add_reference :pets, :type, index: true
  end
end
