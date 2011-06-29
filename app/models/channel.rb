class Channel < ActiveRecord::Base

   attr_accessible :name, :description, :name_pl, :description_pl

  validates :name, :description, :name_pl, :description_pl, :presence => true
  validates :name, :uniqueness => true

  default_scope :order => "name ASC"

  has_many:videos

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
