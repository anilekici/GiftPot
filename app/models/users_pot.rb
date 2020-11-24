class UsersPot < ApplicationRecord
  belongs_to :pot
  belongs_to :user

  validate :check_owner

  def check_owner
    if self.pot.owner == self.user
    errors.add(:top, "You already own this pot, therefore cannot join it")
    end
  end
end
