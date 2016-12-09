class GiftRecommendationsController < ApplicationController
  before_action :current_user_must_be_gift_recommendation_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_gift_recommendation_user
    gift_recommendation = GiftRecommendation.find(params[:id])

    unless current_user == gift_recommendation.recommender
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = GiftRecommendation.ransack(params[:q])
    @gift_recommendations = @q.result(:distinct => true).includes(:recommender, :occasion, :review_comments).page(params[:page]).per(10)

    render("gift_recommendations/index.html.erb")
  end

  def show
    @review_comment = ReviewComment.new
    @gift_recommendation = GiftRecommendation.find(params[:id])

    render("gift_recommendations/show.html.erb")
  end

  def new
    @gift_recommendation = GiftRecommendation.new

    render("gift_recommendations/new.html.erb")
  end

  def create
    @gift_recommendation = GiftRecommendation.new

    @gift_recommendation.gift = params[:gift]
    @gift_recommendation.cost = params[:cost]
    @gift_recommendation.url = params[:url]
    @gift_recommendation.occasion_id = params[:occasion_id]
    @gift_recommendation.selected = params[:selected]
    @gift_recommendation.rating = params[:rating]
    @gift_recommendation.recommender_id = params[:recommender_id]
    @gift_recommendation.description = params[:description]

    save_status = @gift_recommendation.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/gift_recommendations/new", "/create_gift_recommendation"
        redirect_to("/gift_recommendations")
      else
        redirect_back(:fallback_location => "/", :notice => "Gift recommendation created successfully.")
      end
    else
      render("gift_recommendations/new.html.erb")
    end
  end

  def edit
    @gift_recommendation = GiftRecommendation.find(params[:id])

    render("gift_recommendations/edit.html.erb")
  end

  def update
    @gift_recommendation = GiftRecommendation.find(params[:id])

    @gift_recommendation.gift = params[:gift]
    @gift_recommendation.cost = params[:cost]
    @gift_recommendation.url = params[:url]
    @gift_recommendation.occasion_id = params[:occasion_id]
    @gift_recommendation.selected = params[:selected]
    @gift_recommendation.rating = params[:rating]
    @gift_recommendation.recommender_id = params[:recommender_id]
    @gift_recommendation.description = params[:description]

    save_status = @gift_recommendation.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/gift_recommendations/#{@gift_recommendation.id}/edit", "/update_gift_recommendation"
        redirect_to("/gift_recommendations/#{@gift_recommendation.id}", :notice => "Gift recommendation updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Gift recommendation updated successfully.")
      end
    else
      render("gift_recommendations/edit.html.erb")
    end
  end

  def destroy
    @gift_recommendation = GiftRecommendation.find(params[:id])

    @gift_recommendation.destroy

    if URI(request.referer).path == "/gift_recommendations/#{@gift_recommendation.id}"
      redirect_to("/", :notice => "Gift recommendation deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Gift recommendation deleted.")
    end
  end
end
