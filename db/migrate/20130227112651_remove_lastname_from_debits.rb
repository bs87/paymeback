class RemoveLastnameFromDebits < ActiveRecord::Migration
  def up
    remove_column :debits, :lastname
  end

  def down
    add_column :debits, :lastname, :string
  end
end
