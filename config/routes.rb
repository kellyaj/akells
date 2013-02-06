Akells::Application.routes.draw do
  
  
  resources :users


  get "sessions/login_page", :as => 'login_page'

  post "sessions/login"

  get "sessions/logout", :as => 'logout'

  resources :projects


  resources :posts

  match '/feed' => 'posts#feed',
  	:as => :feed,
  	:defaults => { :format => 'atom' }

  root :to => 'posts#index'

  get '/about' => 'pages#about', :as => 'about'

  get 'tags/:tag', to: 'posts#index', as: :tag

end
