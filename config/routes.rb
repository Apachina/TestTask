Rails.application.routes.draw do
  root "static_pages#show"
  resource :admin
end
