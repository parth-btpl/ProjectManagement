Rails.application.routes.draw do
  devise_for :users,
              path: '',
              path_names: {
                sign_in: 'log_in'
              },
              controllers: {
                sessions: 'sessions'
              }
  resources :users
  root 'homes#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :projects do
    resources :tasks do
      resources :comments
    end  
  end

  root 'home#index'
end
