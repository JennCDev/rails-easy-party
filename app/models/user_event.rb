class UserEvent < ApplicationRecord
  STATUS = ["going", "maybe", "can't go", "pending"]
  belongs_to :user
  belongs_to :event
  accepts_nested_attributes_for :user
  validates :status, inclusion: { in: STATUS }
end
