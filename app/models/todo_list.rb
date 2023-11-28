class TodoList < ApplicationRecord
  validates :title, presence: true
  has_many :items
end
