class Session < ApplicationRecord
  attr_accessor :year_filter
  belongs_to :playlist
  has_many :questions
  has_many :user_sessions
end
