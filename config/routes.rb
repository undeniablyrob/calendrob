Rails.application.routes.draw do
  resources :events do
    resources :show
  end

  post "webhooks/invitee_created", to: "webhooks#invitee_created"
end
