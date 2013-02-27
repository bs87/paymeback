class AddLockToUsers < ActiveRecord::Migration
  def change
    add_column :users, :lock, :boolean, :default => false
  end
end
