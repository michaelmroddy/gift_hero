class InterestsController < ApplicationController
  def index
    @q = Interest.ransack(params[:q])
    @interests = @q.result(:distinct => true).includes(:receiver_interests).page(params[:page]).per(10)

    render("interests/index.html.erb")
  end

  def show
    @receiver_interest = ReceiverInterest.new
    @interest = Interest.find(params[:id])

    render("interests/show.html.erb")
  end

  def new
    @interest = Interest.new

    render("interests/new.html.erb")
  end

  def create
    @interest = Interest.new

    @interest.interest = params[:interest]

    save_status = @interest.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/interests/new", "/create_interest"
        redirect_to("/interests")
      else
        redirect_back(:fallback_location => "/", :notice => "Interest created successfully.")
      end
    else
      render("interests/new.html.erb")
    end
  end

  def edit
    @interest = Interest.find(params[:id])

    render("interests/edit.html.erb")
  end

  def update
    @interest = Interest.find(params[:id])

    @interest.interest = params[:interest]

    save_status = @interest.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/interests/#{@interest.id}/edit", "/update_interest"
        redirect_to("/interests/#{@interest.id}", :notice => "Interest updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Interest updated successfully.")
      end
    else
      render("interests/edit.html.erb")
    end
  end

  def destroy
    @interest = Interest.find(params[:id])

    @interest.destroy

    if URI(request.referer).path == "/interests/#{@interest.id}"
      redirect_to("/", :notice => "Interest deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Interest deleted.")
    end
  end
end
