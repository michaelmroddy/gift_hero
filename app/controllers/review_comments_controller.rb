class ReviewCommentsController < ApplicationController
  def index
    @q = ReviewComment.ransack(params[:q])
    @review_comments = @q.result(:distinct => true).includes(:recommendation).page(params[:page]).per(10)

    render("review_comments/index.html.erb")
  end

  def show
    @review_comment = ReviewComment.find(params[:id])

    render("review_comments/show.html.erb")
  end

  def new
    @review_comment = ReviewComment.new

    render("review_comments/new.html.erb")
  end

  def create
    @review_comment = ReviewComment.new

    @review_comment.recommendation_id = params[:recommendation_id]
    @review_comment.comment = params[:comment]

    save_status = @review_comment.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/review_comments/new", "/create_review_comment"
        redirect_to("/review_comments")
      else
        redirect_back(:fallback_location => "/", :notice => "Review comment created successfully.")
      end
    else
      render("review_comments/new.html.erb")
    end
  end

  def edit
    @review_comment = ReviewComment.find(params[:id])

    render("review_comments/edit.html.erb")
  end

  def update
    @review_comment = ReviewComment.find(params[:id])

    @review_comment.recommendation_id = params[:recommendation_id]
    @review_comment.comment = params[:comment]

    save_status = @review_comment.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/review_comments/#{@review_comment.id}/edit", "/update_review_comment"
        redirect_to("/review_comments/#{@review_comment.id}", :notice => "Review comment updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Review comment updated successfully.")
      end
    else
      render("review_comments/edit.html.erb")
    end
  end

  def destroy
    @review_comment = ReviewComment.find(params[:id])

    @review_comment.destroy

    if URI(request.referer).path == "/review_comments/#{@review_comment.id}"
      redirect_to("/", :notice => "Review comment deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Review comment deleted.")
    end
  end
end
