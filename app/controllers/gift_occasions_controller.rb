class GiftOccasionsController < ApplicationController
  before_action :current_user_must_be_gift_occasion_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_gift_occasion_user
    gift_occasion = GiftOccasion.find(params[:id])

    unless current_user == gift_occasion.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = GiftOccasion.ransack(params[:q])
    @gift_occasions = @q.result(:distinct => true).includes(:user, :receiver, :gift_recommendations, :occasion_type).page(params[:page]).per(10)

    render("gift_occasions/index.html.erb")
  end

  def show
    @gift_recommendation = GiftRecommendation.new
    @gift_occasion = GiftOccasion.find(params[:id])

    render("gift_occasions/show.html.erb")
  end

  def new
    @gift_occasion = GiftOccasion.new

    render("gift_occasions/new.html.erb")
  end

  def create
    @gift_occasion = GiftOccasion.new

    @gift_occasion.occasion_type_id = params[:occasion_type_id]
    @gift_occasion.date = params[:date]
    @gift_occasion.user_id = params[:user_id]
    @gift_occasion.receiver_id = params[:receiver_id]
    @gift_occasion.budget = params[:budget]

    save_status = @gift_occasion.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/gift_occasions/new", "/create_gift_occasion"
        redirect_to("/gift_occasions")
      else
        redirect_back(:fallback_location => "/", :notice => "Gift occasion created successfully.")
      end
    else
      render("gift_occasions/new.html.erb")
    end
  end

  def edit
    @gift_occasion = GiftOccasion.find(params[:id])

    render("gift_occasions/edit.html.erb")
  end

  def update
    @gift_occasion = GiftOccasion.find(params[:id])

    @gift_occasion.occasion_type_id = params[:occasion_type_id]
    @gift_occasion.date = params[:date]
    @gift_occasion.user_id = params[:user_id]
    @gift_occasion.receiver_id = params[:receiver_id]
    @gift_occasion.budget = params[:budget]

    save_status = @gift_occasion.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/gift_occasions/#{@gift_occasion.id}/edit", "/update_gift_occasion"
        redirect_to("/gift_occasions/#{@gift_occasion.id}", :notice => "Gift occasion updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Gift occasion updated successfully.")
      end
    else
      render("gift_occasions/edit.html.erb")
    end
  end

  def destroy
    @gift_occasion = GiftOccasion.find(params[:id])

    @gift_occasion.destroy

    if URI(request.referer).path == "/gift_occasions/#{@gift_occasion.id}"
      redirect_to("/", :notice => "Gift occasion deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Gift occasion deleted.")
    end
  end
end
