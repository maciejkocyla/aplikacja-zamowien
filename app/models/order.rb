class Order < ActiveRecord::Base
  attr_accessible :group_id, :id
  belongs_to :group
  has_one :client
end
