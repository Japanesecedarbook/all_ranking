class RankingsController < ApplicationController
  def index
    @rankings = Ranking.all.order(id: "DESC")
    @ranking_likes = Ranking.all.order(likes_count: "DESC")
    @like = Like.new
  end

  def new
    @ranking = Ranking.new
  end

  def create
    @ranking = Ranking.new(ranking_params)
    if @ranking.save
      redirect_to root_path, notice:"ランキング投稿しました"
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

  def show
    @ranking = Ranking.find(params[:id])
    @ranking_likes = Ranking.all.order(likes_count: "DESC")
    @like = Like.new
    @comment = Comment.new
    @comments = @ranking.comments.includes(:user)
  end

  def destroy
    @ranking = Ranking.find(params[:id])
    @ranking.destroy
    redirect_to root_path, notice: 'ランキングを削除しました'
  end

  def search
    @rankings = Ranking.search(params[:keyword])
    @ranking_likes = Ranking.all.order(likes_count: "DESC")
    @like = Like.new
  end

  private
  def ranking_params
    params.require(:ranking).permit(:title, :rank1, :rank2, :rank3, :image).merge(user_id: current_user.id)
  end
end