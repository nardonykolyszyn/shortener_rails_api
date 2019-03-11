# frozen_string_literal: true

Rails.application.routes.draw do
  
  namespace :api do
    namespace :v1 do
      resources :links do
        collection do
          post :shorten
          post :clicks
          post :lookup
        end
  	  end
    end
  end

end
