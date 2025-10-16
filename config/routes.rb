# config/routes.rb
Rails.application.routes.draw do
  namespace :api do
    resources :relatorios, only: [:index, :create]
  end
end


