class Unlock < ActiveRecord::Base
  
  belongs_to :video
  belongs_to :user
  belongs_to :teacher, :class_name => "User"

  default_scope :order => "created_at DESC"

end
