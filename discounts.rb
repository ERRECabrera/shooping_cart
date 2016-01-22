require_relative "products.rb"

class Discount

  attr_accessor :value_discount

  def initialize(value_discount)
    @value_discount = value_discount.round(2)
  end

  def apply_discount(item,amount)
    total = item.price * amount
  end

end

class Volument_discount < Discount

  attr_accessor :value_discount, :amount, :multiple

  def initialize(value_discount,amount,multiple=false)
    super(value_discount)
    @criteria_discount = amount
    @multiple = multiple
  end

  def apply_discount(item,amount)
    total = super
    if amount >= @criteria_discount
      if @multiple
        discounts_aplicables = (amount/@criteria_discount).to_i
        total = total - (discounts_aplicables * @value_discount * item.price)
      else
        total = amount * (item.price * @value_discount)
      end
    end
    return total
  end

end