class RemoveDeviselockToUsers < ActiveRecord::Migration
  def up
    remove_column :users, :failed_attempts
    remove_column :users, :locked_at
  end

  def down
    add_column :users, :locked_at, :string
    add_column :users, :failed_attempts, :integer
  end
end
