class CompanyController < ApplicationController

  def home
    @home = true
    @featured = Video.featured.limit(1)
    @videos = Video.limit(3)
  end

  def about

  end

  def policy

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
