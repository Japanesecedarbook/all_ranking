class RankingsController < ApplicationController
  def index
    @rankings = Ranking.all.order(id: "DESC")
  end

  def new
    @ranking = Ranking.new
  end

  def create
    # Ranking.create(ranking_params)
    @ranking = Ranking.new(ranking_params)
    if @ranking.save
      redirect_to controller: :rankings, action: :index
    else
      render "new"
    end
  end

  def edit
    @ranking = Ranking.find(params[:id])
  end

  def update
    @ranking = Ranking.find(params[:id])
    if @ranking.update(ranking_params)
      redirect_to root_path, notice: 'ランキングを更新しました'
    else
      render :edit
    end
  end

  def destroy
    ranking = Ranking.find(params[:id])
    ranking.destroy
  end

  private
  def ranking_params
    params.require(:ranking).permit(:title, :rank1, :rank2, :rank3, :image).merge(user_id: current_user.id)
  end
end