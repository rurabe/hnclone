class Story < ActiveRecord::Base
  attr_accessible :title, :url
  validates :url, :uniqueness => {:case_sensitive => false, 
                                  :message => "That story has already been submitted"} 
end
