class RelationTypesController < ApplicationController
  def index
    @q = RelationType.ransack(params[:q])
    @relation_types = @q.result(:distinct => true).includes(:gift_receivers).page(params[:page]).per(10)

    render("relation_types/index.html.erb")
  end

  def show
    @gift_receiver = GiftReceiver.new
    @relation_type = RelationType.find(params[:id])

    render("relation_types/show.html.erb")
  end

  def new
    @relation_type = RelationType.new

    render("relation_types/new.html.erb")
  end

  def create
    @relation_type = RelationType.new


    save_status = @relation_type.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/relation_types/new", "/create_relation_type"
        redirect_to("/relation_types")
      else
        redirect_back(:fallback_location => "/", :notice => "Relation type created successfully.")
      end
    else
      render("relation_types/new.html.erb")
    end
  end

  def edit
    @relation_type = RelationType.find(params[:id])

    render("relation_types/edit.html.erb")
  end

  def update
    @relation_type = RelationType.find(params[:id])


    save_status = @relation_type.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/relation_types/#{@relation_type.id}/edit", "/update_relation_type"
        redirect_to("/relation_types/#{@relation_type.id}", :notice => "Relation type updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Relation type updated successfully.")
      end
    else
      render("relation_types/edit.html.erb")
    end
  end

  def destroy
    @relation_type = RelationType.find(params[:id])

    @relation_type.destroy

    if URI(request.referer).path == "/relation_types/#{@relation_type.id}"
      redirect_to("/", :notice => "Relation type deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Relation type deleted.")
    end
  end
end
