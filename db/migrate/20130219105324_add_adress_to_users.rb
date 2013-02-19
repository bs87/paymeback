class AddAdressToUsers < ActiveRecord::Migration
  def change
    add_column :users, :adress, :string
  end
end
