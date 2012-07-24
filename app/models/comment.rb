class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :story
  attr_accessible :body, :user_id, :story_id
end
