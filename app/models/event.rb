class Event < ApplicationRecord
  has_one :chatroom
  has_many :surveys
  has_many :todo_lists
  has_many :user_events
  validates :title, presence: true
  validates :description, presence: true
  has_one_attached :photo_banner
  has_many_attached :photos
  after_create :create_chatroom

  private

  def create_chatroom
    chatroom = Chatroom.create(event: self, name: title)
  end
end
