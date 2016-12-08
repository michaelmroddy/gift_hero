class ReceiverInterestsController < ApplicationController
  def index
    @q = ReceiverInterest.ransack(params[:q])
    @receiver_interests = @q.result(:distinct => true).includes(:receiver, :interest).page(params[:page]).per(10)

    render("receiver_interests/index.html.erb")
  end

  def show
    @receiver_interest = ReceiverInterest.find(params[:id])

    render("receiver_interests/show.html.erb")
  end

  def new
    @receiver_interest = ReceiverInterest.new

    render("receiver_interests/new.html.erb")
  end

  def create
    @receiver_interest = ReceiverInterest.new

    @receiver_interest.interest_id = params[:interest_id]
    @receiver_interest.receiver_id = params[:receiver_id]

    save_status = @receiver_interest.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/receiver_interests/new", "/create_receiver_interest"
        redirect_to("/receiver_interests")
      else
        redirect_back(:fallback_location => "/", :notice => "Receiver interest created successfully.")
      end
    else
      render("receiver_interests/new.html.erb")
    end
  end

  def edit
    @receiver_interest = ReceiverInterest.find(params[:id])

    render("receiver_interests/edit.html.erb")
  end

  def update
    @receiver_interest = ReceiverInterest.find(params[:id])

    @receiver_interest.interest_id = params[:interest_id]
    @receiver_interest.receiver_id = params[:receiver_id]

    save_status = @receiver_interest.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/receiver_interests/#{@receiver_interest.id}/edit", "/update_receiver_interest"
        redirect_to("/receiver_interests/#{@receiver_interest.id}", :notice => "Receiver interest updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Receiver interest updated successfully.")
      end
    else
      render("receiver_interests/edit.html.erb")
    end
  end

  def destroy
    @receiver_interest = ReceiverInterest.find(params[:id])

    @receiver_interest.destroy

    if URI(request.referer).path == "/receiver_interests/#{@receiver_interest.id}"
      redirect_to("/", :notice => "Receiver interest deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Receiver interest deleted.")
    end
  end
end
