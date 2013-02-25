class AddReadToDebits < ActiveRecord::Migration
  def change
    add_column :debits, :read, :boolean, :default => false
  end
end