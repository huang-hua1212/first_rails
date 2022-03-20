class CreateCandidates < ActiveRecord::Migration[7.0]
  def change
    create_table :candidates do |t|
      t.string :name
      t.string :party
      t.integer :age
      t.text :politics
      t.string :votes

      t.timestamps
    end
  end
end
