class RenameCompletedStausToCompletedStatus < ActiveRecord::Migration[8.1]
  def change
    rename_column :tasks, :completed_staus, :completed_status
  end
end
