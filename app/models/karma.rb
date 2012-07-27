class Karma < ActiveRecord::Base
  attr_accessible :author_id, :user_id, :karmable_id, :karmable_type
  belongs_to :user
  belongs_to :author, :class_name => "User"
  belongs_to :karmable, :polymorphic => true

  before_save :add_author_id

  def add_author_id
    self.author_id = self.karmable_type.constantize.find(self.karmable.id).user.id
  end
end
