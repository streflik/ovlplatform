class VideosController < ApplicationController

  before_filter :find_video, :except => [:index,:new,:create,:unlock]
  before_filter :authenticate_user!, :except => [:show, :index]
  before_filter :verify_admin, :except => [:show, :index, :unlock]
  before_filter :find_teachers, :except => [:show, :index]
  before_filter :find_channels, :except => [:show, :index]

  def index
    @videos = Video.all
  end

  def show
    @video_page = true
    @teacher = @video.user
    @channel = @video.channel
    @comments = @video.comments
    @user = @video.user
    @is_locked = is_locked
    @related = @channel.videos.where("id != ?", @video.id).limit(3)
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

  # unlock machinery

  def unlock
    @video = Video.find(params[:video_id])
    if is_locked

      if current_user.credits_available >= @video.price
        unlock = Unlock.create do |u|
          u.video   = @video
          u.user    = current_user
          u.teacher = @video.user
          u.credits = @video.price
          u.commission = @video.commission
          u.expires_at = Time.now + @video.days.days
        end

        
        if current_user.update_attribute :credits_available, current_user.credits_available-@video.price
          unlock.save
          flash[:notice] = t("videos.notice.unlock.success")
        else
          flash[:alert] = t("videos.notice.unlock.fail")
        end

      else
        flash[:alert] = t("v/en/users/1ideos.notice.unlock.not_enough_credits")
      end

    else
      flash[:alert] = t("denied")
    end

    redirect_to @video

  end

  private

  def is_locked
      if (current_user && (current_user.is_subscriber || 
@unlock = Unlock.where(["video_id = ? and user_id = ? and expires_at >= ?", @video.id, current_user.id, Time.now]).first))
        false
      else
        true
      end    
  end

  def find_video
    @video = Video.find(params[:id])
  end

  def find_channels
    @channels = Channel.all
  end

end
