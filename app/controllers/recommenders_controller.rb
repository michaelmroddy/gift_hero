class RecommendersController < ApplicationController
  def index
    @recommenders = Recommender.page(params[:page]).per(10)
  end

  def show
    @recommender = Recommender.find(params[:id])
  end
end
