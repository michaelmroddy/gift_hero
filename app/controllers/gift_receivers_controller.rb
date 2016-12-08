class GiftReceiversController < ApplicationController
  before_action :current_user_must_be_gift_receiver_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_gift_receiver_user
    gift_receiver = GiftReceiver.find(params[:id])

    unless current_user == gift_receiver.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = GiftReceiver.ransack(params[:q])
    @gift_receivers = @q.result(:distinct => true).includes(:user, :receiver_interests, :gift_occasions, :relation).page(params[:page]).per(10)

    render("gift_receivers/index.html.erb")
  end

  def show
    @gift_occasion = GiftOccasion.new
    @receiver_interest = ReceiverInterest.new
    @gift_receiver = GiftReceiver.find(params[:id])

    render("gift_receivers/show.html.erb")
  end

  def new
    @gift_receiver = GiftReceiver.new

    render("gift_receivers/new.html.erb")
  end

  def create
    @gift_receiver = GiftReceiver.new

    @gift_receiver.name = params[:name]
    @gift_receiver.relation_id = params[:relation_id]
    @gift_receiver.user_id = params[:user_id]
    @gift_receiver.male = params[:male]
    @gift_receiver.age = params[:age]
    @gift_receiver.address = params[:address]
    @gift_receiver.birthday = params[:birthday]
    @gift_receiver.anniversary = params[:anniversary]

    save_status = @gift_receiver.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/gift_receivers/new", "/create_gift_receiver"
        redirect_to("/gift_receivers")
      else
        redirect_back(:fallback_location => "/", :notice => "Gift receiver created successfully.")
      end
    else
      render("gift_receivers/new.html.erb")
    end
  end

  def edit
    @gift_receiver = GiftReceiver.find(params[:id])

    render("gift_receivers/edit.html.erb")
  end

  def update
    @gift_receiver = GiftReceiver.find(params[:id])

    @gift_receiver.name = params[:name]
    @gift_receiver.relation_id = params[:relation_id]
    @gift_receiver.user_id = params[:user_id]
    @gift_receiver.male = params[:male]
    @gift_receiver.age = params[:age]
    @gift_receiver.address = params[:address]
    @gift_receiver.birthday = params[:birthday]
    @gift_receiver.anniversary = params[:anniversary]

    save_status = @gift_receiver.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/gift_receivers/#{@gift_receiver.id}/edit", "/update_gift_receiver"
        redirect_to("/gift_receivers/#{@gift_receiver.id}", :notice => "Gift receiver updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Gift receiver updated successfully.")
      end
    else
      render("gift_receivers/edit.html.erb")
    end
  end

  def destroy
    @gift_receiver = GiftReceiver.find(params[:id])

    @gift_receiver.destroy

    if URI(request.referer).path == "/gift_receivers/#{@gift_receiver.id}"
      redirect_to("/", :notice => "Gift receiver deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Gift receiver deleted.")
    end
  end
end
