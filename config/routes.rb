Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #add in the do and end to pass in a black of nested routes
  resources :authors, only: [:show] do 
  #since a post is a child of an author - belongs to an author - it is considered a nested resouce
    resources :posts, only: [:show, :index]
  end 

  #still want to let people see all posts, create and edit posts outside of an author context
  resources :posts, only: [:index, :show, :new, :create, :edit, :update]

  root 'posts#index'

  #create custom routes - this will show /authors/id/post/post index
  #get 'authors/:id/posts', to: 'authors#posts_index'
  #get 'authors/:id/posts/:post_id', to: 'authors#post'
  #/authors/:author_id/posts = author_post_path(author_id, post_id)
    #NOTE THIS IS NOT author_postS_path because we are only looking for one sepcific post

  #THIS IS IMPORTANT READ BELOW
  #/authors page helpers = authors_path and authors_url
  #if you want a single author (/authors/:id), we can use author_path(id)
  #/posts = posts_path 
  #/posts/:id = post_path(id)
  #rake routes shows all of the routes
  #use rake routes | grep authors to filter a search - grep outputs any command to search for what you want

end
