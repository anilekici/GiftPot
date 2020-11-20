class ChangeDatetimeToDate < ActiveRecord::Migration[6.0]
  def change
    change_column :pots, :end_date, :date
    change_column :pots, :start_date, :date
  end
end
