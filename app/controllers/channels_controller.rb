class ChannelsController < ApplicationController

  before_filter :find_channel, :except => [:index,:new,:create]
  before_filter :authenticate_user!, :except => [:show, :index]
  before_filter :verify_admin, :except => [:show, :index]

  def index
    @channels = Channel.all
  end

  def show
    @videos = @channel.videos
  end

  def new
    @channel = Channel.new
  end

  def create
    @channel = Channel.new
    @channel.accessible = :all
    @channel.attributes = params[:channel]
    if @channel.save
      redirect_to(channel_path(@channel), :notice => t("created"))
    else
      render :action => "new"
    end
  end

  def edit
  end

  def update
    @channel.accessible = :all if is_admin?
    if @channel.update_attributes(params[:channel])
      redirect_to(channel_path(@channel), :notice => t("updated"))
    else
      render :action => "edit"
    end
  end

  def destroy
    @channel.destroy
    redirect_to(root_path, :notice => t("deleted"))
  end

  private

  def find_channel
    @channel = Channel.find(params[:id])
  end

end
