class SitemapController < ApplicationController

  def sitemap
    @videos = Video.find(:all, :order => "updated_at DESC", :limit => 50000)
    @teachers = User.teachers(:all, :order => "updated_at DESC", :limit => 50000)
    @channels = Channel.find(:all, :order => "updated_at DESC", :limit => 50000)
    headers["Content-Type"] = "text/xml"
    # set last modified header to the date of the latest entry.
    headers["Last-Modified"] = @videos[0].updated_at.httpdate    
  end

end
