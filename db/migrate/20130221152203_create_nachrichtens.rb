class CreateNachrichtens < ActiveRecord::Migration
  def change
    create_table :nachrichtens do |t|
      t.integer :sentby, :null => false
      t.integer :sentto, :null => false
      t.text :topic
      t.text :body
      t.boolean :read, :default => false
      t.string :create
      t.string :destroy
      t.string :show

      t.timestamps
    end
  end
end
