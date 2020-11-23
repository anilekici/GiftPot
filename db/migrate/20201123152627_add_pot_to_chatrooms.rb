class AddPotToChatrooms < ActiveRecord::Migration[6.0]
  def change
    add_reference :chatrooms, :pot, null: false, foreign_key: true
  end
end
