require_relative '../checkout.rb'
require 'rspec'

RSpec.describe "Checkout class" do

  before(:each) do
    @code = "MUG"
    @mug = Mug.new('Cabify Coffe Mug',7.5,@code)
    @no_discount = Discount.new(0)
    @cabify_pricing_rules = Pricing_rules.new
    @cabify_pricing_rules.add_rules(@code,@mug,@no_discount)
    @cabify_shop = Checkout.new(@cabify_pricing_rules)
  end

  context 'about shopping cart' do    
  
    it 'scan method add code reference to shopping cart' do
      @cabify_shop.scan(@code)
      expect(@cabify_shop.shopping_cart[0]).to eq(@code)
    end

    it 'empty_cart method delete all code reference in shopping cart' do
      @cabify_shop.scan(@code)
      expect(@cabify_shop.shopping_cart.size).to eq(1)
      @cabify_shop.empty_cart
      expect(@cabify_shop.shopping_cart.size).to eq(0)
    end

  end

  context 'calculate a total price of a buy' do
    
    it 'with elements in shopping cart' do
      5.times {@cabify_shop.scan(@code)}
      expect(@cabify_shop.total).to eq(@mug.price*5)
    end

    it 'without element in shopping cart' do
      expect(@cabify_shop.total).to eq(0)
    end

  end

end