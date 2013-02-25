class CreateNachrichtens < ActiveRecord::Migration
  def change
    create_table :nachrichtens do |t|
      t.integer :sentby
      t.integer :sentto
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
