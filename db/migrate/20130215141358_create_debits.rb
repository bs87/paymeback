class CreateDebits < ActiveRecord::Migration
  def change
    create_table :debits do |t|
      t.string :emailcurrentuser
      t.string :emailuser2
      t.float :betrag
      t.date :datum
      t.string :info
      t.boolean :gezahlt

      t.timestamps
    end
  end
end
