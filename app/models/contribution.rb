class Contribution < ApplicationRecord
  belongs_to :user
  belongs_to :pot

  monetize :amount_cents
end
