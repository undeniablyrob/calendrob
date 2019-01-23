Rails.application.routes.draw do
  resources :events do
    resources :show
  end
end
