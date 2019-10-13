class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :teams
  has_many :pokemons, through: :teams

  validates :name, :age, :sex, :profile_image, presence: true, on: :update
end
