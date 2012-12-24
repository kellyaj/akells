Akells::Application.routes.draw do
  
  
  resources :projects


  resources :posts
  root :to => 'posts#index'
  get '/about' => 'pages#about', :as => :about
end
