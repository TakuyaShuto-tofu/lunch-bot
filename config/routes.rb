Rails.application.routes.draw do
  devise_for :users
  #controllers:{registrations:'registrations', sessions: :sessions}
  #root 'コントローラー名#アクション名'でサーバーを立てた最初の画面を設定
  resources :users do
    resources :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
  
  resources :stores
  resources :tops
  resources :mypages
  resources :searches
  root 'home#index'
end
