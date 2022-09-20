Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :coins
    end
  end

  post 'authenticate', to: 'authentication#authenticate'
end
