class Event < ApplicationRecord

  has_many :chatrooms
  has_many :surveys
  has_many :user_events
  validates :title, presence: true
  validates :description, presence: true
end
