class AddOwnerToDebits < ActiveRecord::Migration
  def change
    add_column :debits, :owner ,:string
  end
end