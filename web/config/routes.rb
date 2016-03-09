Rails.application.routes.draw do
  root 'scorecards#show'
  resource :scorecard
  resources :teams, only: [:new, :create, :show]
end
