Rails.application.routes.draw do
  resources :posts

  mount Commentator::Engine => "/commentator"
end
