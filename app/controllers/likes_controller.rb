class LikesController < ApplicationController
  before_action :set_ranking

  def create
    @like = Like.create(user_id: current_user.id, ranking_id: params[:ranking_id])
    @likes = Like.where(ranking_id: params[:ranking_id])
    @ranking.reload
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, ranking_id: params[:ranking_id])
    like.destroy
    @likes = Like.where(ranking_id: params[:ranking_id])
    @ranking.reload
  end

  private

  def set_ranking
    @ranking = Ranking.find(params[:ranking_id])
  end
end
