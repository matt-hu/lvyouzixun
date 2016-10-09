Rails.application.routes.draw do
  resources :tests
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users

  namespace :api do
    namespace :admin do
      namespace :v1 do
       resources :users, only: [:show, :update, :create]
       resources :sessions, only: [:create]
       resources :advertisements, only: [:show]


       # appointments
       get 'users/:user_id/appointments' => 'appointments#index'
       post 'users/:user_id/appointments' => 'appointments#create'
       patch 'users/:user_id/appointments/:id' => 'appointments#update'

       # businesses
       get 'businesses/:id' => 'businesses#show'

       # follows
       get 'users/:user_id/follows' => 'follows#index'
       post 'users/:user_id/follows' => 'follows#create'
       patch 'users/:user_id/follows/:id' => 'follows#update'

       # information
       get 'businesses/:business_id/informations' => 'informations#show'

       # itineraries
       get 'businesses/:business_id/itineraries' => 'itineraries#show'

       # company_types
       get 'company_types' => 'company_types#index'

      end
    end
  end
end
