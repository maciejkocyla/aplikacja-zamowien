class Client < ActiveRecord::Base
  attr_accessible :address, :group_id, :id, :name, :order_id, :surname, :phone
  belongs_to :group
  belongs_to :order

  def full_name 
    @full_name = String.new("#{self.name} #{self.surname}")
  end


end
