class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :user
      t.string :direction
      t.references :voteable, :polymorphic => true

      t.timestamps
    end
  end
end
