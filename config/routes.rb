Rails.application.routes.draw do
  get 'chart/new'
  get 'chart/index'
  get 'new/index'
  root 'pages#index'
  get 'menus/new'
  get 'comments/new'
  get 'workouts/new'
  get 'sessions/new'
  get 'users/new'
  get 'pages/index'
  get 'pages/help'
  get    'likes/index' #いいね一覧ページ
  post   '/likes', to: 'likes#create'  #いいね作成
  delete '/likes', to: 'likes#destroy' #いいね解除
  
  get    '/login',  to: 'sessions#new'     #ログインフォームを表示するページを取得
  post   '/login',  to: 'sessions#create'  #入力されたデータを元にSessionを作成
  delete '/logout', to: 'sessions#destroy' #Sessionを削除する
  
  resources :users
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :workouts
  resources :workouts do
    resources :comments
    #/workouts/:workout_id/comment/newのパスが使用できる
  end
  resources :menus
  resources :relationships, only: [:create, :destroy]
end
