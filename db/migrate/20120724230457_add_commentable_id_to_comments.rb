class AddCommentableIdToComments < ActiveRecord::Migration
  def self.up
    change_table :comments do |t|
      t.references :commentable, :polymorphic => true
    end
  end
  
  def self.down
     change_table :comments do |t|
       t.remove_references :commentable, :polymorphic => true
     end
   end
end
