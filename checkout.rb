require_relative "pricing_rules.rb"

class Checkout

  attr_reader :shopping_cart

  def initialize(pricing_rules)
    @pricing_rules = pricing_rules
    @shopping_cart = []
  end

  def scan(code)
    @shopping_cart.push(code)
  end

  def total
    total = @shopping_cart.uniq.reduce(0) do |sum, code|
      sum + applicable_price(code)
    end
  end

  def print_bill
    puts ""
    puts "Items: #{@shopping_cart.join(', ')}"
    puts "Total: #{sprintf('%.2f', self.total)}€"
  end

  def empty_cart
    @shopping_cart = []
  end

private

  def applicable_price(code)
    product = @pricing_rules.rules[code].item
    amount = @shopping_cart.count(code)
    price = @pricing_rules.rules[code].discount.apply_discount(product,amount)
    return price
  end

end