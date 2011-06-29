module VideosHelper

  def like(video)
    content_tag(:div,
                raw("<fb:like href='#{video_url(video)}' send='true' layout='box_count' width='60' show_faces='false' font=''></fb:like>"),
                :class=>"like")
  end

  def trailer
    raw"<iframe title='YouTube video player' width='940' height='565' src='http://www.youtube.com/embed/#{@video.youtube}?rel=0&amp;hd=1' frameborder='0' allowfullscreen></iframe>"
  end

  def full_version
    raw @video.embed
  end

  def is_locked?(video)
        true
  end

end
