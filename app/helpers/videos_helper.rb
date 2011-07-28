module VideosHelper

  def share(video)
    content_tag(:div,
      raw("<fb:like href='#{video_url(video)}' send='true' layout='box_count' 
           width='60' show_faces='false' font='arial'></fb:like>") +
      if @video_page 		 
        content_tag(:div, raw("<g:plusone size='tall' href='#{video_url(video)}'></g:plusone>"), :class=>"gplus")
      end,
      :class=>"share")
  end

  def youtube(id)
    content_tag(:div,
    (raw"<iframe title='YouTube video player' 
                width='853' 
                height='510' 
                src='http://www.youtube.com/embed/#{id}?rel=0&amp;hd=1' 
                frameborder='0' 
                allowfullscreen>
    </iframe>"),
    :id => "youtube")
   
  end

end
