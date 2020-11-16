class Pot < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: 'user_id'
  has_many :gifts
  has_many :users, through: :users_pot
  validates :name, presence: true
end
