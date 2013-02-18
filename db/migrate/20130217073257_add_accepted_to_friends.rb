class AddAcceptedToFriends < ActiveRecord::Migration
  def change
    add_column :friends, :accepted, :boolean, :default => "false"
  end
end
