class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :owned_pots, class_name: 'Pot'

  has_many :votes

  has_many :users_pots
  has_many :pots, through: :users_pots

  validates :first_name, :last_name, :email, presence: true
end
