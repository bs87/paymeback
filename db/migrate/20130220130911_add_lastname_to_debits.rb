class AddLastnameToDebits < ActiveRecord::Migration
  def change
    add_column :debits, :lastname, :string
  end
end
