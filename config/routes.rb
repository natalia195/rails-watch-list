Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :lists, only: [:index, :show, :new, :create] do
    resources :bookmarks, only: [:index, :show]
    resources :movies, only: [:index, :show]
  end

  resource :movies, only: [:show, :update, :destroy]

  resolve("Basket") { route_for(:movies) }
end
