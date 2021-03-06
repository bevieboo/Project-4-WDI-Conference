Rails.application.routes.draw do


# ============= normal controller =============
  resources :tickets
  resources :events
  resources :users
  resources :charges

  get '/' => 'homes#index'


  #============ api controller ================
  namespace :api do
    resources :tickets
    resources :events
    resources :users
    resources :seats do
    collection do
      put '/revert' => 'seats#revert_seats'
    end

      # member do
      #   put '/revert' => 'seats#revert_seats'
      # end

    end
  end

  get '/login' => 'sessions#loginpage'
  post '/login' => 'sessions#login'
  get '/logout' => 'sessions#logout'
  post '/apply' => 'users#apply'

  put '/api/apply' => 'api/applyings#update'
  delete '/api/apply' => 'api/applyings#destroy'

  delete '/event_speaker/:id' => 'users#destroy_event_speaker'
end
