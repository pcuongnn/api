Rails.application.routes.draw do
  devise_for :users

  namespace :api, defaults: {format: :json} do
    post :sign_up, to: 'users#create'
  end
end
