class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  include PgSearch::Model
  pg_search_scope :search_by_email,
                  against: [:email],
                  using: {
                    tsearch: { prefix: true }
                  }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :created_events, class_name: 'Event', foreign_key: 'creator_id'
  has_many :user_events, dependent: :destroy
  has_many :user_items
  has_many :user_answers
  has_many :todo_lists
  has_many :events, through: :user_events
  has_many :attended_events, through: :user_events, source: :event
  has_many :created_surveys, class_name: 'Survey', foreign_key: 'creator_id'
  has_many :created_todo_lists, class_name: 'TodoList', foreign_key: 'creator_id'
  has_one_attached :avatar
  has_many :surveys, dependent: :destroy

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: { minimum: 6 }, confirmation: true
  validates :password_confirmation, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
end
