class Group < ActiveRecord::Base
  attr_accessible :id, :name
  has_many :users

  validates :name, uniqueness: true
end
