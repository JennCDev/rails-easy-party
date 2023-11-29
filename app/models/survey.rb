class Survey < ApplicationRecord
  belongs_to :user
  belongs_to :event
  has_many :answers
  # belongs_to :user_hidden, optional: true
  validates :question, presence: true
  validates :deadline, presence: true
end
