Rails.application.routes.draw do
  # get "votes/create"
  # get "polls/index"
  # get "polls/show"
  root "polls#index"
  resources :polls, only: [ :index, :show ] do
    post "vote", to: "votes#create", as: :vote
  end
end
