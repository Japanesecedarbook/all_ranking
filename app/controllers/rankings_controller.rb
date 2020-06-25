class RankingsController < ApplicationController
  def index
    @rankings = Ranking.all
  end

  def new
    @ranking = Ranking.new
  end

  def create
    Ranking.create(ranking_params)
  end

  private
  def ranking_params
    params.require(:ranking).permit(:title, :rank1, :rank2, :rank3, :image).merge(user_id: current_user.id)
  end

end
