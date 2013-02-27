class RemoveLockFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :lock
  end

  def down
    add_column :users, :lock, :boolean
  end
end
