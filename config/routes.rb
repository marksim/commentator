Commentator::Engine.routes.draw do
  resources :comments do
    member do
      get :reply
    end
  end
end
