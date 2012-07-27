class CreateKarmas < ActiveRecord::Migration
  def change
    create_table :karmas do |t|
      t.integer :user_id
      t.integer :author_id
      t.references :karmable, :polymorphic => true
      t.timestamps
    end
  end
end
