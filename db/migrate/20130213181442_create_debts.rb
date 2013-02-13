class CreateDebts < ActiveRecord::Migration
  def change
    create_table :debts do |t|
      t.string :Vorname
      t.string :Nachname
      t.float :Betrag
      t.text :info

      t.timestamps
    end
  end
end
