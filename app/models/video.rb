class Video < ActiveRecord::Base

  attr_accessible :channel_id, :user_id, :name, :name_pl, :description, :description_pl, :embed, :duration, :level, :is_featured, :is_paid, :price, :days, :youtube

  validates :name, :name_pl, :level, :duration, :embed, :description, :description_pl, :channel_id, :user_id, :presence => true
  validates :name, :uniqueness => true

  LEVEL = {"Beginner" => 0, "Advanced" => 1}

  default_scope :order => "created_at DESC"

  scope :featured, where(:is_featured => true)

  has_many :comments
  belongs_to :channel
  belongs_to :user

  # translation

  def t_name
    if I18n.locale == :en
      name
    else
      name_pl
    end
  end

  def t_description
    if I18n.locale == :en
      description
    else
      description_pl
    end
  end

end
