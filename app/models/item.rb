class Item < ApplicationRecord
  belongs_to :todo_list
  has_many :user_items
  validates :content, presence: true
end
