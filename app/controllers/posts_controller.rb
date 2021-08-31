class PostsController < ApplicationController

  def index
    #need to update the index and show according to the params :show and :index
    #addin the conditional to posts#index actio to account for whether the user is trying to access the index of all posts
    #or ELSE if they are tryig to index all of the posts by a certain author
    if params[:author_id]
      #finds and indexes posts based on a specific author
      #route would look like /authors/:id/posts
      @posts = Author.find(params[:author_id]).posts 
    else 
      #route would look like /posts
      @posts = Post.all
    end 
    
  end

  def show
    #posts show is going to render the same information - the data concerning a single post 
    #regardless of whether it is accessed via /authors/:id/posts/:id or /posts/:id
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.save
    redirect_to post_path(@post)
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to post_path(@post)
  end

  def edit
    @post = Post.find(params[:id])
  end

private

  def post_params
    params.require(:post).permit(:title, :desription, :post_status, :author_id)
  end
end
