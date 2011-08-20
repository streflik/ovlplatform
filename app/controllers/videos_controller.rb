class VideosController < ApplicationController

  before_filter :find_video, :except => [:index, :feed, :new, :create, :unlock]
  before_filter :authenticate_user!, :except => [:show, :index, :feed]
  before_filter :verify_admin, :except => [:show, :index, :feed, :unlock]
  before_filter :find_teachers, :except => [:show, :index, :feed]
  before_filter :find_channels, :except => [:show, :index, :feed]

  def index
    @videos = Video.all
  end

  def show
    @channel = @video.channel
    @comments = @video.comments
    @teacher = @video.user
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
 
        if current_user.update_attribute :credits_available, current_user.credits_available - @video.price
          unlock.save
          flash[:notice] = t("unlocked")
        else
          flash[:alert] = t("fail")
        end

      else
        flash[:alert] = t("not_enough_credits")
      end

    else
      flash[:alert] = t("denied")
    end

    redirect_to @video

  end

def feed
  # this will be the name of the feed displayed on the feed reader
  @title = "OVL FEED"

  # the news items
  @news_items = Video.order("updated_at desc")

  # this will be our Feed's update timestamp
  @updated = @news_items.first.updated_at unless @news_items.empty?

  respond_to do |format|
    format.atom { render :layout => false }

    # we want the RSS feed to redirect permanently to the ATOM feed
    format.rss { redirect_to feed_path(:format => :atom), :status => :moved_permanently }
  end
end

  private

  def is_locked
      if (current_user && (current_user.is_subscriber || @unlock = Unlock.where(["video_id = ? and user_id = ? and expires_at >= ?", @video.id, current_user.id, Time.now]).first))
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

  def find_teachers
    @teachers = User.teachers
  end

end
