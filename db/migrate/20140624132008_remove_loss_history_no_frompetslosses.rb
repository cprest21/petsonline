class RemoveLossHistoryNoFrompetslosses < ActiveRecord::Migration
  def change
  	remove_column :pets_losses, :Loss_history_no, index: true
  end
end
