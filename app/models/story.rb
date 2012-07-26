class Story < ActiveRecord::Base
  attr_accessible :title, :url, :user_id
  validates :url, :uniqueness => {:case_sensitive => false, 
                                  :message => "That story has already been submitted"} 
                                  
  belongs_to :user
  has_many :comments, :as => :commentable
  has_many :comments
  has_many :votes, :as => :voteable
end
