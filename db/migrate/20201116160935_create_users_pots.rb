class CreateUsersPots < ActiveRecord::Migration[6.0]
  def change
    create_table :users_pots do |t|
      t.references :pot, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
