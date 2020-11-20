class Pot < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: 'user_id'
  
  has_many :users_pots
  has_many :users, through: :users_pots

  has_many :gifts
  has_many :gift_votes, through: :gifts

  validates :name, presence: true

  def days_remaining
    date = Date.today
    days_left = (self.end_date - date).to_i
  end

end

