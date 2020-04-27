Rails.application.routes.draw do
  devise_for :users,
              path: '',
              path_names: {
                sign_in: 'log_in'
              },
              controllers: {
                sessions: 'sessions'
              }
  resources :projects
  resources :users
  root 'homes#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
