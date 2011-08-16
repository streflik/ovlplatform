module VideosHelper

  def youtube(id)
    content_tag(:div,
    (raw"<iframe title='YouTube video player' 
                width='640' 
                height='390' 
                src='http://www.youtube.com/embed/#{id}?rel=0&amp;hd=1' 
                frameborder='0' 
                allowfullscreen>
    </iframe>"),
    :id => "youtube")
   
  end

end
