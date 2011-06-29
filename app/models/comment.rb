class Comment < ActiveRecord::Base

  belongs_to :user
  belongs_to :video

  attr_accessible :body

  validates :user_id, :video_id, :body, :presence => true

end
