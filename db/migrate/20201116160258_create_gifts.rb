class CreateGifts < ActiveRecord::Migration[6.0]
  def change
    create_table :gifts do |t|
      t.references :pot, null: false, foreign_key: true
      t.integer :votes, default: 0
      t.timestamps
    end
  end
end
