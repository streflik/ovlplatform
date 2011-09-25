class CompanyController < ApplicationController

  before_filter :authenticate_user!, :only => [:guide]
  before_filter :verify_admin, :only => [:guide]

  def home
    @home = true
    @featured = Video.featured.limit(1)
    @videos = Video.limit(3)
  end

  def about

  end

  def guide

  end

  def terms

  end

  def change_language
    url = request.referer
    unless url =~ /(\/pl|\/en)/
      url += "#{params[:locale]}" 
    else
      url.gsub!(/(\/pl|\/en)/,"/#{params[:locale]}")
    end
    redirect_to url
  end

end
