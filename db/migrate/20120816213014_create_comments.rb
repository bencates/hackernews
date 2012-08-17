class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :title
      t.text :body
      t.integer :karma, :default => 1
      t.references :story

      t.timestamps
    end
    add_index :comments, :story_id
  end
end
