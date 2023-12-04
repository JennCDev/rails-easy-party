class Answer < ApplicationRecord
  belongs_to :survey
  has_many :user_answers
end
