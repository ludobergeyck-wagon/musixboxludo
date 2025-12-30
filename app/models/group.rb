class Group < ApplicationRecord
  has_many :user_sessions
  belongs_to :host, class_name: "User", optional: true
end