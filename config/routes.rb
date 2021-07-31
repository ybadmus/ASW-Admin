# frozen_string_literal: true

Rails.application.routes.draw do
  resources :categories
  resources :posts
  resources :home, only: %i[index show create]
  devise_for :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, :defaults => {:format => :json} do
    namespace :v1 do
      resources :categories do
        resources :posts 
      end

      resources :posts do
        collection do
          get :top_news
          get :latest_news_only
          get :entertainment_news_only
          get :trending
        end
      end
      resources :newsletters, only: %i[create]
      resources :enquiries, only: %i[create]
    end
  end

  root to: 'categories#index'
end
