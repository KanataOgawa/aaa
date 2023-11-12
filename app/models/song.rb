class Song < ApplicationRecord
    belongs_to :music
    belongs_to :user
    has_many :likes, dependent: :destroy
    has_many :liked_users, through: :likes, source: :user

    def find_youtube_url
        if youtube_url.present?
          if youtube_url[0..16] == "https://youtu.be/"
            return youtube_url[17..27]
          else
            return youtube_url[32..42]
          end
        else
          # youtube_url が nil の場合の処理を追加
          return "No URL"
        end
    end
    mount_uploader :image, ImageUploader
end
