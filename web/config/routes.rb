Rails.application.routes.draw do
  root 'scorecard#show'
  resource :scorecard
end
