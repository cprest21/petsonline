class AddlossHistoryNoTopetslosses < ActiveRecord::Migration
  def change
    add_column :pets_losses, :Loss_history_no, :integer, auto_increment: true
  end
end
