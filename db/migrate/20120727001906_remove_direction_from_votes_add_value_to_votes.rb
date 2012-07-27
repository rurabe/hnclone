class RemoveDirectionFromVotesAddValueToVotes < ActiveRecord::Migration
  change_table :votes do |t|
    t.remove :direction
    t.integer :value
  end
end
