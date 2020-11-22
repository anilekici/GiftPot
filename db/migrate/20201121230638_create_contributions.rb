class CreateContributions < ActiveRecord::Migration[6.0]
  def change
    create_table :contributions do |t|
      t.string :contribution_sku
      t.monetize :amount currency: { present: false }
      t.string :session_id
      t.references :user, null: false, foreign_key: true
      t.references :pot, null: false, foreign_key: true

      t.timestamps
    end
  end
end
