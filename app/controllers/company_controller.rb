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

end
