class Group < ActiveRecord::Base
  attr_accessible :id, :name
  has_many :users
  has_many :orders
  has_many :clients
  validates :name, uniqueness: true
end
