Rails.application.routes.draw do
  resources :comments
  devise_for :users
  root to: "home#index"

  devise_scope :user do    #ログアウトの設定
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :users
  resources :rooms do
    
    collection do
      get 'own' #own.html.erbにルーティング
    end
  end
  resources :reservations do
    member do
      post 'confirm', to: 'reservations#confirm'
    end
  
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
