class TodoList < ApplicationRecord
  validates :title, presence: true
  has_many :items, dependent: :destroy
  belongs_to :user
  belongs_to :event
end
