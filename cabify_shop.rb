require 'pry'

require_relative "checkout.rb"

#create products
voucher = Voucher.new('Cabify Voucher',5,"VOUCHER")
tshirt = Tshirt.new('Cabify T-Shirt',20,"TSHIRT")
mug = Mug.new('Cabify Coffe Mug',7.5,"MUG")

#create discounts
two_for_one = Volument_discount.new(1,2,true)
bulk_purchases = Volument_discount.new(0.95,3)
no_discount = Discount.new(0)

#create pricing_rules
cabify_pricing_rules = Pricing_rules.new

#list of rules to pricing_rules
rules = [
  ["VOUCHER",voucher,two_for_one],
  ["TSHIRT",tshirt,bulk_purchases],
  ["MUG",mug,no_discount]
]

#adding rules to pricing_rules instance
rules.each {|rule| cabify_pricing_rules.add_rules(rule[0],rule[1],rule[2])}

#create checkout instance 
co = Checkout.new(cabify_pricing_rules)

#list of sells
sells = [
  ['VOUCHER', 'TSHIRT', 'MUG'],
  ['VOUCHER', 'TSHIRT', 'VOUCHER'],
  ['TSHIRT', 'TSHIRT', 'TSHIRT', 'VOUCHER', 'TSHIRT'],
  ['VOUCHER', 'TSHIRT', 'VOUCHER', 'VOUCHER', 'MUG', 'TSHIRT', 'TSHIRT']
]

#process of buying
sells.each do |sell|
  sell.each {|code| co.scan(code)}
  co.print_bill
  co.empty_cart
end

puts ""