class MusicsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]

    def index
   
    end
 
    def new
        @music = Music.new
    end
    
    def create
        # データベース内に同じ content 値が存在するか確認
      if Music.exists?(content: music_params[:content])
          @music = Music.new
          @music.errors.add(:content, "アーティスト名はすでに存在します")
          render :new
      else
          @music = Music.new(music_params)
          if @music.save
            # カテゴリーに応じてリダイレクト先を設定
            if @music.category == "idol"
              redirect_to musics_idol_path
            elsif @music.category == "japaneserock"
              redirect_to musics_japaneserock_path
            elsif @music.category == "japanesepop"
              redirect_to musics_japanesepop_path
             elsif @music.category == "jazz"
              redirect_to musics_jazz_path 
            elsif @music.category == "hiphop"
              redirect_to musics_hiphop_path 
            elsif @music.category == "enka"
              redirect_to musics_enka_path 
            elsif @music.category == "anime"
              redirect_to musics_anime_path 
            elsif @music.category == "classic"
              redirect_to musics_classic_path 
            elsif @music.category == "Kpop"
              redirect_to musics_Kpop_path
            else
              # その他のカテゴリーに対するリダイレクト先を設定する場合、ここに追加
              redirect_to musics_westernrock_path
            end
          else
             render :new
          end
      end
    end
    
    def idol
      if params[:search] == nil
        @musics = Music.all
      elsif params[:search] == ''
        @musics = Music.all
      else
        @musics = Music.where("content LIKE ? ",'%' + params[:search] + '%')
      end
    end 
      
  def westernrock
    if params[:search] == nil
      @musics = Music.all
    elsif params[:search] == ''
      @musics = Music.all
    else
      @musics = Music.where("content LIKE ? ",'%' + params[:search] + '%')
    end
  end
     
  def japaneserock
    if params[:search] == nil
      @musics = Music.all
    elsif params[:search] == ''
      @musics = Music.all
    else
      @musics = Music.where("content LIKE ? ",'%' + params[:search] + '%')
    end
  end

  def japanesepop
    if params[:search] == nil
      @musics = Music.all
    elsif params[:search] == ''
      @musics = Music.all
    else
      @musics = Music.where("content LIKE ? ",'%' + params[:search] + '%')
    end
  end

  def enka
    if params[:search] == nil
      @musics = Music.all
    elsif params[:search] == ''
      @musics = Music.all
    else
      @musics = Music.where("content LIKE ? ",'%' + params[:search] + '%')
    end
  end

  def jazz
    if params[:search] == nil
      @musics = Music.all
    elsif params[:search] == ''
      @musics = Music.all
    else
      @musics = Music.where("content LIKE ? ",'%' + params[:search] + '%')
    end
  end

  def hiphop
    if params[:search] == nil
      @musics = Music.all
    elsif params[:search] == ''
      @musics = Music.all
    else
      @musics = Music.where("content LIKE ? ",'%' + params[:search] + '%')
    end
  end

  def Kpop
    if params[:search] == nil
      @musics = Music.all
    elsif params[:search] == ''
      @musics = Music.all
    else
      @musics = Music.where("content LIKE ? ",'%' + params[:search] + '%')
    end
  end

  def classic
    if params[:search] == nil
      @musics = Music.all
    elsif params[:search] == ''
      @musics = Music.all
    else
      @musics = Music.where("content LIKE ? ",'%' + params[:search] + '%')
    end
  end

  def anime
    if params[:search] == nil
      @musics = Music.all
    elsif params[:search] == ''
      @musics = Music.all
    else
      @musics = Music.where("content LIKE ? ",'%' + params[:search] + '%')
    end
  end

  def destroy
    music = Music.find(params[:id])
    category = music.category 
  
    music.destroy
  
    case category
    when "idol"
      redirect_to musics_idol_path
    when "japaneserock"
      redirect_to musics_japaneserock_path
    when "anime"
      redirect_to musics_anime_path
    when "Kpop"
      redirect_to musics_Kpop_path
    when "enka"
      redirect_to musics_enka_path
    when "japanesepop"
      redirect_to musics_japanesepop_path
    when "jazz"
      redirect_to musics_jazz_path
    when "hiphop"
      redirect_to musics_hiphop_path
    when "classic"
      redirect_to musics_classic_path
    else
      redirect_to musics_westernrock_path
    end
  end


  def artist_songs
    @music = Music.find(params[:id])
    @new_song = Song.new
    @songs = @music.songs
  end

      private
      def music_params
        params.require(:music).permit(:music, :hand, :note, :content, :category, :image)
      end
end
