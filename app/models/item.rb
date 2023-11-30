class Item < ApplicationRecord
  belongs_to :todo_list
  has_many :items
  validates :content, presence: true
end
