class AddCommentToSongs < ActiveRecord::Migration[6.1]
  def change
    add_column :songs, :comment, :text
  end
end
