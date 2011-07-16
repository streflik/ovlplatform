class Channel < ActiveRecord::Base

  attr_accessible :name_en, :name_pl, :tagline_en, :tagline_pl

  validates :name_en, :name_pl, :tagline_en, :tagline_pl, :presence => true
  validates :name_en, :name_pl, :uniqueness => true

  default_scope :order => "created_at DESC"

  has_many:videos

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
