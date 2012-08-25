class Product < ActiveRecord::Base
  attr_accessible :client_id, :completed, :group_id, :id, :incoming, :kind, :name, :quantity
  belongs_to :client

  
end
