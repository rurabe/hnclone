class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :commentable, :polymorphic => true
  belongs_to :story
  has_many :comments, :as => :commentable
  attr_accessible :body, :user_id, :commentable_type, :commentable_id, :story_id
end
