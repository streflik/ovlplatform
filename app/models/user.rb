class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :description, :description_pl, :accept_policy

  validates :first_name, :last_name, :email, :presence => true
  validates_acceptance_of :accept_policy, :accept => true

  scope :teachers, where(:is_teacher => true)

  has_many :comments
  has_many :videos

  default_scope :order => "last_name ASC"

  def name
    first_name + " " + last_name
  end

  # translation

  def t_description
    if I18n.locale == :en
      description
    else
      description_pl
    end
  end

end
