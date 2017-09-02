Rails.application.routes.draw do
  resources :posts do
    #
    # 14/03 12
    member do
      get 'toggle_follow', to: 'posts#toggle_follow'
      get 'toggle_like', to: 'posts#toggle_like'
  end
end

# get "/posts/:id/like" , to: 'posts#like'

  devise_for :users
  root 'pages#feed'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
