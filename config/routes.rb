Rails.application.routes.draw do
  resources :web_settings
  devise_for :users
  # root :to => "devise/sessions#new"
  root :to => "application#search"

  post '/search_results', :to => 'application#search_results'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
