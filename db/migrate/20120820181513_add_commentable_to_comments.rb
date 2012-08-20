class AddCommentableToComments < ActiveRecord::Migration
  def change
    add_column :comments, :commentable_id, :integer
    add_column :comments, :commentable_type, :string
    remove_index :comments, :story_id
    remove_column :comments, :story_id
  end
end
