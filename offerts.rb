require_relative "products.rb"
require_relative "discounts.rb"

class Offert

  attr_accessor :item, :discount

  def initialize(item,discount)
    @item = item
    @discount = discount
  end

end