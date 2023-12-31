class Event < ApplicationRecord
  has_one :chatroom, dependent: :destroy
  has_many :surveys, dependent: :destroy
  has_many :todo_lists, dependent: :destroy
  has_many :user_events, dependent: :destroy
  validates :title, presence: true
  validates :description, presence: true
  has_one_attached :photo_banner
  has_many_attached :photos

  def new_photos=(photos)
    self.photos.attach(photos)
  end

  # def get_all_names
  #   string = ""
  #   self.user_events.each do |user_event|
  #     string += user_event.user.first_name
  #   end
  #   return string
  # end


  after_create :create_chatroom

  private

  def create_chatroom
    chatroom = Chatroom.create(event: self, name: title)
  end
end
