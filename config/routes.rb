Rails.application.routes.draw do
  devise_for :users
  #controllers:{registrations:'registrations', sessions: :sessions}
  #root 'コントローラー名#アクション名'でサーバーを立てた最初の画面を設定
  resources :stores
  resources :homes
  
  root 'homes#index'
end
