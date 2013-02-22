class RemoveCreateDestroyShowFromNachrichtens < ActiveRecord::Migration
  def up
    remove_column :nachrichtens, :create
    remove_column :nachrichtens, :destroy
    remove_column :nachrichtens, :show
  end

  def down
    add_column :nachrichtens, :show, :string
    add_column :nachrichtens, :destroy, :string
    add_column :nachrichtens, :create, :datetime
  end
end
