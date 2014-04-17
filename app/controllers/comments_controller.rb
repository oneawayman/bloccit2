class CommentsController < ApplicationController
  def create
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])
    @comment = @post.comments
    @comment = current_user.comments.build(comment_params)
    @comment.post = @post

  authorize! :create, @comment, message: "You need to be signed up to do that"
  if @comment.save
      flash[:notice] = "Comment added"
      @comments = @post.comments
      redirect_to [@topic, @post]
  else
      flash[:error] = "There was an error saving the post. Please try again."
      render 'posts/show'
    end
  end
end
