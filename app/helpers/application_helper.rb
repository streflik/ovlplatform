module ApplicationHelper

  def title(page_title)
    content_for(:title) { page_title }
    page_title
  end

  def link_to_with_highlight(name, options = {}, html_options = {}) # same sig as #link_to
    html_options.merge!({ :class => 'current' }) if current_page?(options)
    link_to(name, options, html_options)
  end

  def is_home
    @home
  end

  def home
    content_tag(:li, (link_to "#{t"home.link_to"}", root_path))
  end

  def sign_in
    link_to t("users.sign_in.title"), new_user_session_path	
  end

  def is_admin?
    current_user.is_admin == true
  end

  def is_owner?(object)
    is_admin? || object.user == current_user
  end

  # users

  def nav(user)
  content_tag(:ul,
    content_tag(:li, t("users.nav.hello", :name => user.first_name)) +
    unless user.is_subscriber
    content_tag(:li, t("users.nav.credits_available", :number => user.credits_available)) +
    content_tag(:li, link_to_unless_current(t("users.nav.credits"), credits_user_path(user)))
    end +
    content_tag(:li, link_to_unless_current(t("users.nav.hub"), hub_user_path(user))) +
    content_tag(:li, link_to_unless_current(t("users.nav.edit"), edit_user_path(user))) +
    content_tag(:li, link_to_unless_current(t("users.nav.password"), password_user_path(user))) +
    if user.is_teacher
      content_tag(:li, link_to(t("users.nav.show"), user_path(user)))
    end +
    if user.is_admin
      content_tag(:li, link_to("Admin", admin_user_path(user)))
    end +
    content_tag(:li, link_to(t("users.nav.sign_out"), destroy_user_session_path)))
  end

  # description of video, channel or user
 
  def description(object)
    content_tag(:div, raw(auto_link(object.description)), :class=>"description")	
  end

  # tagline of user or channel

  def tagline(object)
    content_tag(:p, object.tagline, :class=>"tagline")
  end

  # video

  def meta(video)
  content_tag(:ul,
    content_tag(:li, l(video.created_at)) +
    content_tag(:li, video.duration) +
    content_tag(:li, level(video)) +
    unless is_home
    content_tag(:li, t("videos.meta.comments_number", :number=>video.comments.count))
    end +
    if video.is_paid
      content_tag(:li, t("videos.meta.unlocks_number", :number=>video.unlocks.count))
    end +
    unless is_home
      content_tag(:li, raw(t("videos.language.native") + native(video))) + #raw(native(video)) )+
      content_tag(:li, raw(t("videos.language.captions") + en_captions(video) + pl_captions(video)))   
    end,
  :class=>"meta")   	
  end

  def native(video)
    if video.native == "pl"
      image_tag("pl.png")
    else
      image_tag("en.png")
    end
  end

  def en_captions(video)
    if video.has_en_captions
      image_tag("en.png")
    end
  end

  def pl_captions(video)
    if video.has_pl_captions
      image_tag("pl.png")
    end
  end

  def level(video)
    if video.level == 0
      t("videos.level.basic")
    else
      t("videos.level.pro")
    end
  end

  def price(video)
    content_tag(:span, t("videos.access.price", :price => video.price), :class => "price")
  end

  def days(video)
    content_tag(:span, t("videos.access.days", :days => video.days), :class => "days")
  end

  def free
    content_tag(:span, t("videos.access.free"), :class=>"free")
  end

end
