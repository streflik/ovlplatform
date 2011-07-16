class CommentsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :is_owner, :only=>[:destroy]

  def create
    @comment = Comment.create(params[:comment]) do |c|
      c.video_id = params[:video_id]
      c.user = current_user
    end
    if @comment.save
      @video = @comment.video
      redirect_to video_path(@comment.video) + "#comments", :notice => t("created")
    else
      redirect_to video_path(@comment.video) + t("created")
    end
  end

  def destroy
    @comment.destroy
    redirect_to @comment.video, :notice => t("deleted")
  end

  private

  def is_owner
    @comment = Comment.find(params[:id])
    is_owner?(@comment) ? true : render(:nothing=>true)
  end

end
