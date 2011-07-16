class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
      
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :description_en, 
  :description_pl, :accept_policy, :tagline_en, :tagline_pl

  validates :first_name, :last_name, :email, :presence => true
  validates_acceptance_of :accept_policy, :accept => true

  scope :teachers, where(:is_teacher => true)

  has_many :comments
  has_many :videos
  has_many :unlocks
  has_many :earnings, :class_name=>"Unlock",:foreign_key=>"teacher_id"

  default_scope :order => "last_name ASC"

  def name
    first_name + " " + last_name
  end

  # translation

  def description
    if I18n.locale == :en
      description_en
    else
      description_pl
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
