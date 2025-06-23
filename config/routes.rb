Rails.application.routes.draw do
  root "articles#index"

  resources :articles, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  get "/articles", to: "articles#index"

  get "up" => "rails/health#show", as: :rails_health_check

  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

end
