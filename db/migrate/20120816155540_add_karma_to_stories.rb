class AddKarmaToStories < ActiveRecord::Migration
  def change
    add_column :stories, :karma, :integer, default: 1
  end
end
