class Gift < ApplicationRecord
  belongs_to :pot
  has_many :gift_votes

  validates :name, :price, presence: true

  def votes
    gift_votes.count
  end
end
