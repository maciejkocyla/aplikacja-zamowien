class Client < ActiveRecord::Base
  attr_accessible :address, :group_id, :id, :name, :order_id, :surname, :phone
  belongs_to :group
  has_many :orders

  def full_name 
    @full_name = String.new("#{self.name} #{self.surname}")
  end

  accepts_nested_attributes_for :orders
end
