class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :playlists
  has_many :user_sessions
  has_many :questions
  # validates :pseudo, presence: true, uniqueness: true

  # Retourne le pseudo si défini, sinon "Player X"
  def display_name
    pseudo.presence || "Player #{id}"
  end
end
