class Story < ActiveRecord::Base
  attr_accessible :title, :url, :user_id
  validates :url, :uniqueness => {:case_sensitive => false,
                                  :message => "That story has already been submitted"}

  belongs_to :user
  has_many :comments, :as => :commentable
  has_many :comments
  has_many :votes, :as => :voteable

  scope :joins_with_votes, joins('LEFT OUTER JOIN votes ON stories.id = votes.voteable_id')
  scope :order_by_votes_over_time, order("((CAST(COUNT(votes.id) AS REAL)) / (strftime('%s','NOW') - strftime('%s',stories.created_at))) DESC")


end
