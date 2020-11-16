class CreatePots < ActiveRecord::Migration[6.0]
  def change
    create_table :pots do |t|
      t.string :name, null: false
      t.text :description
      t.datetime :start_date
      t.datetime :end_date
      t.integer :min_amount, default: 1, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
