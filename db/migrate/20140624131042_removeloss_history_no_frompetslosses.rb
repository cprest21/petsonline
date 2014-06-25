class RemovelossHistoryNoFrompetslosses < ActiveRecord::Migration
  def change
    remove_column :pets_losses, :loss_history_no, index: true
  end
end
