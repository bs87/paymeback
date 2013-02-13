class CreateDebits < ActiveRecord::Migration
  def change
    create_table :debits do |t|
      t.string :firstname
      t.string :lastname
      t.float :charge
      t.text :info

      t.timestamps
    end
  end
end
