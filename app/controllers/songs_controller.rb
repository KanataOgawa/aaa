class SongsController < ApplicationController
    def new
        @song = Song.new
    end
       
   def create
       @song = Song.new(song_params)
       @song.user_id = current_user.id
       if @song.save
          redirect_to artist_songs_path(@song.music), notice: "曲が投稿されました"
       else
          render :new
       end
   end
   
   def show
    @song = Song.find(params[:id])
    
   end 
   def like
    song = Song.find(params[:id])
    current_user.likes.create(song: song)
    redirect_to song
end

   private
     def song_params
          params.require(:song).permit(:title, :music_id, :youtube_url, :image, :comment)
     end
end
