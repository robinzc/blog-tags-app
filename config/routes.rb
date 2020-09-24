Rails.application.routes.draw do
  namespace :api do

    get "posts/" => "posts#index"
    get "posts/:id" => "posts#show"
    post "posts/" => "posts#create"
    patch "posts/:id" => "posts#update"
    delete "posts/:id" => "posts#destroy"

    get "tags/" => "tags#index"
    get "tags/:id" => "tags#show"

  end 
end
