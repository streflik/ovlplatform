class Video < ActiveRecord::Base

  attr_accessible :channel_id, :user_id, :name_en, :name_pl, :description_en, :description_en_paid, :description_pl, 
  :description_pl_paid, :paid_video_sd, :paid_video_hd, :paid_video_iphone, :duration, :commission, :level, :is_featured, :is_paid, :price, :days, :youtube_video,
  :native, :has_pl_captions, :has_en_captions, :thumb_file_name, :thumb_content_type, :thumb_file_size, :thumb_updated_at, 
  :summary_pl, :summary_en, :chapters_pl, :chapters_en
     
  validates :name_en, :name_pl, :level, :duration, :youtube_video,  :description_en, :description_pl, 
  :summary_pl, :summary_en, :channel_id, :user_id, :native, :chapters_pl, :chapters_en, :presence  => true

  validates :summary_en, :length => {:maximum => 150}
  validates :summary_pl, :length => {:maximum => 150}

  LEVEL = {"Beginner" => 0, "Advanced" => 1}
  CAPTIONS = {"Polish" => "pl", "English" => "en"}

  default_scope :order => "created_at DESC"

  scope :featured, where(:is_featured => true)

  has_many :comments
  belongs_to :channel
  belongs_to :user
  has_many :unlocks

  has_attached_file :thumb, :styles => { :hd => "1280x720#", :sd => "640x360#",  :normal => "220x135#", :mini => "60x35#" }, 
  :default_url => '/images/default-thumb.jpeg',
  :url => "/system/videos/:attachment/:id/:style/:basename.:extension",  
  :path => ":rails_root/public/system/videos/:attachment/:id/:style/:basename.:extension"
 
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

  def description
    if I18n.locale == :en
      description_en
    else
      description_pl
    end
  end

  def description_paid
    if I18n.locale == :en
      description_en_paid
    else
      description_pl_paid
    end
  end

  def summary
    if I18n.locale == :en
      summary_en
    else
      summary_pl
    end
  end

  def chapters
    if I18n.locale == :en
      chapters_en
    else
      chapters_pl
    end
  end

end
