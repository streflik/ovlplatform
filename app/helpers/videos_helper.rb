module VideosHelper

  def like(video)
    content_tag(:div,
      raw("<fb:like href='#{video_url(video)}' send='true' layout='box_count' width='60' show_faces='false' font='arial'></fb:like>") +
      if @video_page 		 
      content_tag(:div, raw("<g:plusone size='tall' href='#{video_url(video)}'></g:plusone>"), :class=>"gplus")
      end,
      :class=>"like")
  end

  def youtube_trailer
    raw"<iframe title='YouTube video player' 
                width='700' 
                height='428' 
                src='http://www.youtube.com/embed/#{@video.youtube_trailer}?rel=0&amp;hd=1' 
                frameborder='0' 
                allowfullscreen>
    </iframe>"
  end

end
