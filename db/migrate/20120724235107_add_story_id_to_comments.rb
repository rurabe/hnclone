class AddStoryIdToComments < ActiveRecord::Migration
  def self.up
    change_table :comments do |t|
      t.references :story
    end
  end
  
  def self.down
     change_table :comments do |t|
       t.remove_references :story
     end
  end   
end
