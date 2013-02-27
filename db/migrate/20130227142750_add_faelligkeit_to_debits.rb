class AddFaelligkeitToDebits < ActiveRecord::Migration
  def change
    add_column :debits, :faelligkeit, :date
  end
end