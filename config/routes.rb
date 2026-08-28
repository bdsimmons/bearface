Rails.application.routes.draw do
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  get "privacy" => "public_pages#privacy", as: :privacy
  get "terms" => "public_pages#terms", as: :terms
  get "ledger" => "public_pages#ledger", as: :ledger
  get "ledger/connect" => "public_pages#ledger_connect", as: :ledger_connect
  get "ledger/disconnect" => "public_pages#ledger_disconnect", as: :ledger_disconnect

  mount Plum::Engine, at: "/"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
