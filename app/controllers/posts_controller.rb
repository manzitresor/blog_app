class PostsController < ApplicationController
  def index
    @users = [User.find(params[:user_id])]
    @posts = @users[0].posts
  end

  def show
    @posts = [Post.find(params[:id])]
    @comment = Comment.new
  end
  def new
    @post = Post.new
  end
  def create
    @post = Post.new(params.require(:post).permit(:title, :text))
    @post.author(id: current_user)
    if @post.save 
      redirect_to user_path(id: current_user)
    else
      render :new
    end
  end
end
