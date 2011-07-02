module ApplicationHelper

  def title(page_title)
    content_for(:title) { page_title }
    page_title
  end

  def link_to_with_highlight(name, options = {}, html_options = {}) # same sig as #link_to
    html_options.merge!({ :class => 'current' }) if current_page?(options)
    link_to(name, options, html_options)
  end

  def home
    content_tag(:li, (link_to "#{t"home.link_to"}", root_path))
  end

  def sign_in
    link_to t("users.sign_in.title"), new_user_session_path	
  end

  # users

  def nav(user)
  content_tag(:ul,
    content_tag(:li, t("users.nav.hello", :name => user.first_name)) +
    content_tag(:li, t("users.nav.credits_available", :number => user.credits_available)) +
    content_tag(:li, link_to_unless_current(t("users.nav.credits"), credits_user_path(user))) +
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
    content_tag(:div, auto_link(raw object.t_description), :class=>"description")	
  end

  # video

  def meta(video)
  content_tag(:ul,
    content_tag(:li, l(video.created_at)) +
    content_tag(:li, video.duration) +
    content_tag(:li, level(video)) +
    content_tag(:li, "#{video.comments.count} comments") +
    if video.is_paid
      content_tag(:li, "#{video.comments.count} unlocks")
    end,
  :class=>"meta")   	
  end

  def level(video)
    if video.level = 0
      t("videos.level.basic")
    else
      t("videos.level.pro")
    end
  end

  def paid(video)
    content_tag(:span, t("videos.access.paid", :price=>video.price, :days=>video.days), :class=>"free")
  end

  def free_video
    content_tag(:span, t("videos.access.free"), :class=>"free")
  end

end
