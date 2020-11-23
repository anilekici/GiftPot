class AddTotalAmountToPots < ActiveRecord::Migration[6.0]
  def change
    add_column :pots, :total_amount, :integer, default: 0
  end
end
