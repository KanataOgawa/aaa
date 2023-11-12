class Music < ApplicationRecord
    has_many :songs
    has_many :songs, dependent: :destroy
    mount_uploader :image, ImageUploader   
    validates :content, uniqueness: true
end
