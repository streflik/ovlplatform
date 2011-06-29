class UsersController < ApplicationController

  before_filter :find_user, :except => [:index]
  before_filter :find_teachers, :only => [:index]
  before_filter :authenticate_user!, :except => [:index, :show]
  before_filter :verify_user, :only => [:hub, :credits, :edit, :update, :password]
  before_filter :verify_teacher, :only => [:show]

  # admin views

  def admin
    @videos = Video.all
    @channels = Channel.all
    @users = User.all
    @teachers = User.teachers
    @comments = Comment.all
  end

  # users views

  def index
    render :layout => "application"
  end

  def show
    @videos = @user.videos
    render :layout => "application"
  end

  def hub
  end

  def credits
  end

  def edit
  end

  def update
    @user.accessible = :all if is_admin?
    if @user.update_attributes(params[:user])
      redirect_to hub_user_path(@user), :notice => t("updated")
    else
      render :action => "edit"
    end
  end

  def password
    if request.put?
      if @user.update_with_password(params[:user])
        redirect_to hub_user_path(@user),:notice => t("updated")
      else
        render :action => 'password'
      end
    end
  end

  private

  def find_user
    @user = User.find(params[:id])
  end



end
