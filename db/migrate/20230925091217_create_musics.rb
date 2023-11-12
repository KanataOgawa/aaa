class CreateMusics < ActiveRecord::Migration[6.1]
  def change
    create_table :musics do |t|
      t.string :music
      t.text :hand
      t.string :note

      t.timestamps
    end
  end
end
