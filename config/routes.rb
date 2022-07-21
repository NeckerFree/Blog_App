Rails.application.routes.draw do
  get "/login", to: "login#index" 
  get "/users", to: "users#index" 
  get "/users/:id", to: "users#show" 
  get "/users/:id/posts", to: "posts#index" 
  get "/users/:id/posts/:post_id", to: "posts#show" 
end
