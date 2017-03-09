class User < ActiveRecord::Base
  has_secure_password

  has_many :ideas
  has_many :likes, dependent: :destroy
  has_many :ideas, through: :likes, source: :idea

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

  validates :name, :alias, :email, :password, :password_confirmation, presence: true
  validates_length_of :name, :alias, minimum: 2
  validates_length_of :password, minimum: 8
  validates :password, confirmation: true
  validates :email, uniqueness: {case_sensitive: false}, format: {with: EMAIL_REGEX}
end
