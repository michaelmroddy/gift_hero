class GiftOccasionTypesController < ApplicationController
  def index
    @q = GiftOccasionType.ransack(params[:q])
    @gift_occasion_types = @q.result(:distinct => true).includes(:gift_occasions).page(params[:page]).per(10)

    render("gift_occasion_types/index.html.erb")
  end

  def show
    @gift_occasion = GiftOccasion.new
    @gift_occasion_type = GiftOccasionType.find(params[:id])

    render("gift_occasion_types/show.html.erb")
  end

  def new
    @gift_occasion_type = GiftOccasionType.new

    render("gift_occasion_types/new.html.erb")
  end

  def create
    @gift_occasion_type = GiftOccasionType.new


    save_status = @gift_occasion_type.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/gift_occasion_types/new", "/create_gift_occasion_type"
        redirect_to("/gift_occasion_types")
      else
        redirect_back(:fallback_location => "/", :notice => "Gift occasion type created successfully.")
      end
    else
      render("gift_occasion_types/new.html.erb")
    end
  end

  def edit
    @gift_occasion_type = GiftOccasionType.find(params[:id])

    render("gift_occasion_types/edit.html.erb")
  end

  def update
    @gift_occasion_type = GiftOccasionType.find(params[:id])


    save_status = @gift_occasion_type.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/gift_occasion_types/#{@gift_occasion_type.id}/edit", "/update_gift_occasion_type"
        redirect_to("/gift_occasion_types/#{@gift_occasion_type.id}", :notice => "Gift occasion type updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Gift occasion type updated successfully.")
      end
    else
      render("gift_occasion_types/edit.html.erb")
    end
  end

  def destroy
    @gift_occasion_type = GiftOccasionType.find(params[:id])

    @gift_occasion_type.destroy

    if URI(request.referer).path == "/gift_occasion_types/#{@gift_occasion_type.id}"
      redirect_to("/", :notice => "Gift occasion type deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Gift occasion type deleted.")
    end
  end
end
