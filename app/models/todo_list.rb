class TodoList < ApplicationRecord
  validates :title, presence: true
  has_many :items
  belongs_to :user
  belongs_to :event
end
