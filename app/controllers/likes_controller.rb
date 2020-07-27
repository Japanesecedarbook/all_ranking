class LikesController < ApplicationController
  before_action :set_ranking, only: [:create, :destroy]

  def create
    like = current_user.likes.build(ranking_id: params[:ranking_id])
    like.save
  end

  def destroy
    like = current_user.likes.find_by(ranking_id: params[:ranking_id])
    like.destroy
  end

  private

  def set_ranking
    @ranking = Ranking.find(params[:ranking_id])
  end
end
