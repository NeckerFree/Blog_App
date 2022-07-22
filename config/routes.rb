Rails.application.routes.draw do
  get "/login", to: "login#index" 
  get "/users", to: "users#index" 
  get "/users/:id", to: "users#show" 
  get "/posts/new", to: "posts#new" 
  post "/posts/create", to: "posts#create" 
  get "/users/:id/posts/:post_id/comments/new", to: "comments#new" 
  post "/users/:id/posts/:post_id/comments/create", to: "comments#create" 
  get "/users/:id/posts/:post_id/likes/new", to: "likes#new" 
  post "/users/:id/posts/:post_id/likes/create", to: "likes#create" 
  get "/users/:id/posts", to: "posts#index" 
  get "/users/:id/posts/:post_id", to: "posts#show" 
end
