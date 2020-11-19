class CreateGiftVotes < ActiveRecord::Migration[6.0]
  def change
    create_table :gift_votes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :gift, null: false, foreign_key: true

      t.timestamps
    end
  end
end
