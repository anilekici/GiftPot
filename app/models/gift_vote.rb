class GiftVote < ApplicationRecord
  belongs_to :user
  belongs_to :gift
end
