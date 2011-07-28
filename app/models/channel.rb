class Channel < ActiveRecord::Base

  attr_accessible :name_en, :name_pl, :tagline_en, :tagline_pl, :thumb_file_name, 
  :thumb_content_type, :thumb_file_size, :thumb_updated_at

  validates :name_en, :name_pl, :tagline_en, :tagline_pl, :presence => true
  validates :name_en, :name_pl, :uniqueness => true

  default_scope :order => "created_at DESC"

  has_many:videos

  has_attached_file :banner, :styles => { :normal => "940x65#" }, 
  :default_url => '/images/default-banner.jpeg',
  :url => "/system/channels/:attachment/:id/:style/:basename.:extension",  
  :path => ":rails_root/public/system/channels/:attachment/:id/:style/:basename.:extension"

  has_attached_file :thumb, :styles => { :normal => "400x250#" }, 
  :default_url => '/images/default-channel-thumb.jpeg',
  :url => "/system/channels/:attachment/:id/:style/:basename.:extension",  
  :path => ":rails_root/public/system/channels/:attachment/:id/:style/:basename.:extension"

validates_attachment_presence :banner
validates_attachment_size :banner, :less_than => 1.megabytes  
validates_attachment_content_type :banner, :content_type => ['image/jpeg', 'image/png'] 

validates_attachment_presence :thumb
validates_attachment_size :thumb, :less_than => 1.megabytes  
validates_attachment_content_type :thumb, :content_type => ['image/jpeg', 'image/png'] 

  # translation

  def name
    if I18n.locale == :en
      name_en
    else
      name_pl
    end
  end

  def tagline
    if I18n.locale == :en
      tagline_en
    else
      tagline_pl
    end
  end

end
