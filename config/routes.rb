Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'home#top'
  get "/" => 'home#top'

  post "home/create" => 'home#create'
  post "home/times_post" => 'home#times_post'
  
  get ":id/edit" => 'home#edit'
  post ":id/update" => 'home#update'

  get ":id/delete" => 'home#delete'
  post ":id/destroy" => 'home#destroy'

  get "page/1" => redirect("../")
  get "page/:id" => 'home#page'
  
  
  
  




  get "test1" => 'home#test1'
  post "update2/:id" => 'home#test2'



end
