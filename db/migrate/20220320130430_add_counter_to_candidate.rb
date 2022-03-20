class AddCounterToCandidate < ActiveRecord::Migration[7.0]
  def change
    add_column :candidates, :vote_logs_count, :integer
  end
end
