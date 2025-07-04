class CommentsController < ApplicationController
  def create 
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    if @comment.save
      redirect_to post_path(@post)
    else
      @post.comments.reload
      render 'posts/show', status: :unprocessable_entity
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
