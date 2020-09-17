class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @rankings = Ranking.page(params[:page]).per(5).order(id: "DESC")
    @ranking_likes = Ranking.all.order(likes_count: "DESC")
    @like = Like.new
  end
end