Rails.application.routes.draw do
  root 'scorecards#show'
  resource :scorecard
end
