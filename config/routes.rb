Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources 'articles', only: [:index, :show]
  resources 'boards', only: [:index, :show]
  resources 'authors', only: [:index, :show]
end
