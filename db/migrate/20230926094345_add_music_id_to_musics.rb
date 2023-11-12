class AddMusicIdToMusics < ActiveRecord::Migration[6.1]
  def change
    add_column :musics, :user_id, :integer
  end
end
