class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item

  #Show all orders, sorted by last purchased
  def self.all_orders
    orders = Order.all.reverse_order
  end
  
end
