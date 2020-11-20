class CreateGifts < ActiveRecord::Migration[6.0]
  def change
    create_table :gifts do |t|
      t.string :name, null: false
      t.references :pot, null: false, foreign_key: true
      t.timestamps
    end
  end
end
