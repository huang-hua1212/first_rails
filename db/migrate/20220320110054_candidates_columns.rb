class CandidatesColumns < ActiveRecord::Migration[7.0]
  def change
    # change_table :candidates do |t|
    #   t.rename :old_column1, :new_column1
    #   t.rename :old_column2, :new_column2
    # end
    change_column :candidates, :votes, :integer
  end
end
