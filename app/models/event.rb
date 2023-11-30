class Event < ApplicationRecord
  has_many :chatrooms
  has_many :surveys
  has_many :todo_lists
  has_many :user_events
  validates :title, presence: true
  validates :description, presence: true
  has_one_attached :photo_banner
  has_many_attached :photos
end
