# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :shortener do
      	collection do
      	post :shorten, to: 'shortener#shorten'
      	post :clicks, to: 'shortener#clicks'
      	post :lookup, to: 'shortener#lookup'
      end
  	  end
    end
  end
end
