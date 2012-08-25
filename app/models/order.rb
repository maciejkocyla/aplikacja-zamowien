class Order < ActiveRecord::Base
  attr_accessible :group_id, :id
  belongs_to :group
  belongs_to :client

  accepts_nested_attributes_for :client
end
