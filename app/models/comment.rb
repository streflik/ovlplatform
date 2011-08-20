class Comment < ActiveRecord::Base

  attr_accessible :body

  belongs_to :user
  belongs_to :video

  validates :user_id, :video_id, :body, :presence => true

end
