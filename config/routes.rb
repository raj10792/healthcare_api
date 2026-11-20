Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  namespace :api do
    namespace :v1 do

      # Public routes
      post "register", to: "registrations#create"
      post "login", to: "sessions#create"

      # Protected routes
      resources :patients, only: [:index, :show, :create] do
        resources :medical_records, only: [:index, :show]
        resources :prescriptions, only: [:index, :show]
        resources :lab_orders, only: [:index, :show]
      end

      resources :doctors, only: [:index, :show]

      resources :appointments do
        member do
          patch :cancel
          patch :reschedule
        end
      end

      resources :prescriptions, only: [:create]

      resources :clinics

      delete "logout", to: "sessions#destroy"

    end
  end
end
