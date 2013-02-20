class AddArtToDebits < ActiveRecord::Migration
  def change
    add_column :debits, :art, :string
  end
end