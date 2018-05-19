Rails.application.routes.draw do
  devise_for :users
  # root :to => "devise/sessions#new"
  root :to => "application#search"

  get '/search_results', :to => 'application#search_results'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
