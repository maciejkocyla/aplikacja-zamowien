class Client < ActiveRecord::Base
  attr_accessible :address, :group_id, :id, :name, :order_id, :surname, :phone, :products_attributes
  belongs_to :group
  has_many :products

  def full_name 
    @full_name = String.new("#{self.name} #{self.surname}")
  end

  accepts_nested_attributes_for :products, :allow_destroy => true
end
