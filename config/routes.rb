Rails.application.routes.draw do
  
  get '/agents' => 'agents#index'

  namespace :api do
    namespace :v1 do
      get '/agents' => 'agents#index'
      get '/agents/:id' => 'agents#show'
      post '/agents' => 'agents#create'
      patch '/agents/:id/edit' => 'agents#update'
      delete '/agents/:id' => 'agents#destroy'
    end

    namespace :v2 do
      get '/agents' => 'agents#index'
      get '/agents/:id' => 'agents#show'
      post '/agents' => 'agents#create'
      patch '/agents/:id/edit' => 'agents#update'
      delete '/agents/:id' => 'agents#destroy'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
