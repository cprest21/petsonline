class AddLossHistoryNoTopetslosses < ActiveRecord::Migration
  def change
  	add_column :pets_losses, :loss_history_no, :integer, auto_increment: true
  end
end
