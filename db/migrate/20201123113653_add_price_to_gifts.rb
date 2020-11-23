class AddPriceToGifts < ActiveRecord::Migration[6.0]
  def change
    add_column :gifts, :price, :integer, default: 0
  end
end
