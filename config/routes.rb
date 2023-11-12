Rails.application.routes.draw do
  devise_for :users
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 
  get 'musics/idol' => 'musics#idol'
  get 'musics/westernrock' => 'musics#westernrock'
  get 'musics/japaneserock' => 'musics#japaneserock'
  get 'musics/Kpop' => 'musics#Kpop'
  get 'musics/enka' => 'musics#enka'
  get 'musics/hiphop' => 'musics#hiphop'
  get 'musics/japanesepop' => 'musics#japanesepop'
  get 'musics/jazz' => 'musics#jazz'
  get 'musics/anime' => 'musics#anime'
  get 'musics/classic' => 'musics#classic'
  get 'musics/artist_songs/:id' => 'musics#artist_songs', as: :artist_songs
 
  resources :users, only: [:show] # ユーザーマイページへのルーティング
  resources :musics
  resources :songs  do
    resources :likes, only: [:create, :destroy]
  end
  root 'musics#index'
  
end