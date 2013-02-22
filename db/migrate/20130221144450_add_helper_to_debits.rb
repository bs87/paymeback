class AddHelperToDebits < ActiveRecord::Migration
  def change
    add_column :debits, :helper ,:string
  end
end