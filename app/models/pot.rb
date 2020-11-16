class Pot < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: 'user_id'
  has_many :users_pots
  has_many :gifts
  has_many :users, through: :users_pots
  validates :name, presence: true
end
