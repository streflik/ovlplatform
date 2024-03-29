class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
      
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :description_en, 
  :description_pl, :accept_policy, :tagline_en, :tagline_pl, :avatar_file_name, :avatar_content_type, :avatar_file_size, 
  :avatar_updated_at

  has_many :comments
  has_many :videos
  has_many :unlocks
  has_many :earnings, :class_name => "Unlock", :foreign_key => "teacher_id"
  has_many :payments

  has_attached_file :avatar, :styles => { :thumb => "220x135#", :normal => "130x130#", :mini => "60x60#" }, 
  :default_url => '/images/avatar.png',
  :url => "/system/users/:attachment/:id/:style/:basename.:extension",  
  :path => ":rails_root/public/system/users/:attachment/:id/:style/:basename.:extension"

  validates :first_name, :last_name, :email, :presence => true
  validates_acceptance_of :accept_policy, :accept => true

  validates_attachment_size :avatar, :less_than => 1.megabytes  
  validates_attachment_content_type :avatar, :content_type => ['image/jpg', 'image/jpeg', 'image/png'] 

  scope :teachers, where(:is_teacher => true)

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
