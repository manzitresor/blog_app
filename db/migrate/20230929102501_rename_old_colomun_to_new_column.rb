class RenameOldColomunToNewColumn < ActiveRecord::Migration[7.0]
  def change
    rename_column :posts, :commentsCounter, :comments_counter
    rename_column :posts, :linkesCounter, :likes_counter
  end
end
