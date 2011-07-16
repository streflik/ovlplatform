class Video < ActiveRecord::Base

  attr_accessible :channel_id, :user_id, :name_en, :name_pl, :description_en, :description_en_paid, :description_pl, 
  :description_pl_paid, :full_version, :duration, :commission, :level, :is_featured, :is_paid, :price, :days, :youtube_trailer,
  :native, :has_pl_captions, :has_en_captions
     
  validates :name_en, :name_pl, :level, :duration, :full_version, :youtube_trailer, 
  :description_en, :description_pl, :channel_id, :user_id, :native, :presence  => true

  LEVEL = {"Beginner" => 0, "Advanced" => 1}
  CAPTIONS = {"Polish" => "pl", "English" => "en"}

  default_scope :order => "created_at DESC"

  scope :featured, where(:is_featured => true)

  has_many :comments
  belongs_to :channel
  belongs_to :user
  has_many :unlocks

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

end
