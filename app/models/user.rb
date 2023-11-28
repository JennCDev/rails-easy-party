class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :created_events, class_name: 'Event', foreign_key: 'creator_id'
  has_many :user_events
  has_many :attended_events, through: :user_events, source: :event
  has_many :created_surveys, class_name: 'Survey', foreign_key: 'creator_id'
  has_many :created_todo_lists, class_name: 'TodoList', foreign_key: 'creator_id'
  has_one_attached :avatar

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: { minimum: 6 }, confirmation: true
  validates :password_confirmation, presence: true
end
