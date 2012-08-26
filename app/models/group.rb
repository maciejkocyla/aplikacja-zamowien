class Group < ActiveRecord::Base
  attr_accessible :id, :name, :password, :password_confirmation
  has_secure_password
  has_many :users
  has_many :orders
  has_many :clients
  
  validates :name, uniqueness: true
  validates :password, presence: true, length: {minimum: 8}
  validates :password_confirmation, presence: true
end
