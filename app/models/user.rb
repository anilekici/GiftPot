class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :owned_pots, class_name: 'Pot'

  has_many :users_pots
  has_many :pots, through: :users_pots

  has_one :gift_vote

  validates :first_name, :last_name, :email, presence: true

  def has_voted_in_pot?(pot)
    pot.gift_votes.find_by(user: self).present?
  end

  def has_voted?(gift)
    GiftVote.find_by(gift: gift, user: self).present?
  end

end
