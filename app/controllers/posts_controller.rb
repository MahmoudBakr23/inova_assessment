class PostsController < ApplicationController
    def create
      post = Post.new(post_params)
      post.user_id = params[:user_id] # Assuming user_id is passed in params
      if post.save
        render json: post, status: :created
      else
        render json: post.errors, status: :unprocessable_entity
      end
    end
  
    def user_posts
      posts = Post.where(user_id: params[:user_id]).order(created_at: :desc).page(params[:page]).per(10)
      render json: posts
    end
  
    def top_posts
      posts = Post.joins(:reviews).group('posts.id').order('AVG(reviews.rating) DESC').page(params[:page]).per(10)
      render json: posts
    end
  
    private
  
    def post_params
      params.require(:post).permit(:title, :body)
    end
  end
  