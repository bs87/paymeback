class AddFirstnameToDebits < ActiveRecord::Migration
  def change
    add_column :debits, :firstname, :string
  end
end
