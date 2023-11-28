class Survey < ApplicationRecord
  belongs_to :user
  belongs_to :event
  has_many :questions
  has_many :user_answers
  # belongs_to :user_hidden, optional: true
end
