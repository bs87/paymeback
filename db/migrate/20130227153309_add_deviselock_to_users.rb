class AddDeviselockToUsers < ActiveRecord::Migration
  def change
    add_column :users, :failed_attempts, :integer
    add_column :users, :locked_at, :datetime
  end
end
