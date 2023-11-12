class AddContentToMusics < ActiveRecord::Migration[6.1]
  def change
    add_column :musics, :content, :string
  end
end
