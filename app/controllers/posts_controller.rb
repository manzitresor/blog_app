class PostsController < ApplicationController
  def index
    @user = [User.find(params[:user_id])]
    @posts = @user[0].posts
   end
  def show
    @posts = [Post.find(params[:id])]
  end
end
