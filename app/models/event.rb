class Event < ApplicationRecord
  has_many :chatrooms
  has_many :surveys
  has_many :todo_lists
  has_many :user_events
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


end
