class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :songs, dependent: :destroy #追記 ユーザーが削除されたら、ツイートも削除されるようになります。すでに書いてある場合は追記しなくて大丈夫です。
         has_many :likes, dependent: :destroy
         has_many :liked_songs, through: :likes, source: :song
         validates :name, presence: true #追記
         validates :profile, length: { maximum: 200 } #追記
      
         has_many:likes

         def already_liked?(song)
          self.likes.exists?(song_id: song.id)
        end
 end
