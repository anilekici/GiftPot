class AddNumberToVotes < ActiveRecord::Migration[6.0]
  def change
    add_column :votes, :number, :integer, default: 0
  end
end
