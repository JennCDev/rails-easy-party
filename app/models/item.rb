class Item < ApplicationRecord
  belongs_to :todo_list
  validates :content, presence: true
  has_many :users, through: :user_items
  has_many :user_items, dependent: :destroy
end
