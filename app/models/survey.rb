class Survey < ApplicationRecord
  CATEGORIES = %w(Date Lieu Autre)
  belongs_to :user
  belongs_to :event
  has_many :answers, dependent: :destroy
  # belongs_to :user_hidden, optional: true
  validates :question, presence: true
  validates :deadline, presence: true
  validates :category, presence: true, inclusion: { in: CATEGORIES }
end
