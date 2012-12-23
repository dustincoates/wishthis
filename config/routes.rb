Wishthis::Application.routes.draw do

  resources :users do
    resources :items
  end

  root :to => 'home#index'

  match '/login' => 'session#new', :via => :get
  match '/login' => 'session#create', :via => :post
  match '/logout' => 'session#destroy', :via => :get

  match '/change-password' => 'users#change_password', :via => :get, :as => 'change_password'
  match '/change-password' => 'users#change_password', :via => :post, :as => 'change_password'

  match 'popup_add' => 'items#popup_add', :via => :get

end
