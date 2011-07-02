class VideosController < ApplicationController

  before_filter :find_video, :except => [:index,:new,:create]
  before_filter :authenticate_user!, :except => [:show, :index]
  before_filter :verify_admin, :except => [:show, :index]
  before_filter :find_teachers, :except => [:show, :index]
  before_filter :find_channels, :except => [:show, :index]

  def index
    @videos = Video.all
  end

  def show
    @teacher = @video.user
    @channel = @video.channel
    @comments = @video.comments
    @user = @video.user
  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.new
    @video.accessible = :all
    @video.attributes = params[:video]
    if @video.save
      redirect_to(video_path(@video), :notice => t("created"))
    else
      render :action => "new"
    end
  end

  def edit
  end

  def update
    @video.accessible = :all if is_admin?
    if @video.update_attributes(params[:video])
      redirect_to(video_path(@video), :notice => t("updated"))
    else
      render :action => "edit"
    end
  end

  def destroy
    @video.destroy
    redirect_to(root_path, :notice => t("deleted"))
  end

  private

  def find_video
    @video = Video.find(params[:id])
  end

  def find_channels
    @channels = Channel.all
  end

end
