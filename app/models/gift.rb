class Gift < ApplicationRecord
  belongs_to :pot
  has_many :votes
end
