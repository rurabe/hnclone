class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :voteable, :polymorphic => true
  attr_accessible :value, :user_id, :voteable_id, :voteable_type
end
