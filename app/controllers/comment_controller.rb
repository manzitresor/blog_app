class CommentController < ApplicationController
    def new 
        @comment =  Comment.new
    end
    def create
        @comment = Comment.new(params.require(:comment).permit(:text))
        post = Post.find(params[:post_id])
        user = User.find(params[:user_id])
        comment.author = current_user
        comment.post = post
    
        flash[:alert] = 'Please add new comment' unless comment.save
        redirect_to user_posts_path(user_id: user, id: post)
    end
end