class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    redirect_to ranking_path(comment.ranking.id)
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, ranking_id: params[:ranking_id])
  end
end
