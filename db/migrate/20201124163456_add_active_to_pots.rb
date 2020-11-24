class AddActiveToPots < ActiveRecord::Migration[6.0]
  def change
    add_column :pots, :active, :boolean, null: false, default: true
  end
end
