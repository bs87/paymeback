class AddArtToDebits < ActiveRecord::Migration
  def change
    add_column :debits, :art, :string
    add_column :debits, :helper ,:string
  end
end