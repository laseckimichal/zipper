Rails.application.routes.draw do
  mount Rswag::Ui::Engine  => '/api/docs'
  mount Rswag::Api::Engine => '/api/docs'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  namespace :api do
    namespace :v1 do
      resources :files, only: %i[index create]
    end
  end
end
