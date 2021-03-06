class User < ActiveRecord::Base

  belongs_to :group

  attr_accessible :email, :name, :password, :password_confirmation, :group_id, :group_password
  has_secure_password

  before_save { |user| user.email = email.downcase}
  before_save :create_remember_token

  validates :password, presence: true, length: {minimum: 8}
  validates :password_confirmation, presence: true
  validates :name, presence: true, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: {case_sensitive: false}

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
