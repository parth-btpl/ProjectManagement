# frozen_string_literal: true

Rails.application.routes.draw do
  resources :projects do
    resources :tasks do
      resources :comments
    end
  end

  root 'home#index'
end
