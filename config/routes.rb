Rails.application.routes.draw do
  get '/', to: 'welcome#show'

  get '/auth/:provider/callback', to: 'sessions#create'

  resources :goals, only: [:index]
  resources :users do
    resources :goals, only: [:index]
  end
end
