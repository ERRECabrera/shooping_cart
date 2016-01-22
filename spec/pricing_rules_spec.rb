require_relative '../pricing_rules.rb'
require 'rspec'

RSpec.describe "Pricing_rules Class" do

  context 'are accessible into instance of pricing_rules class' do
  
    before(:each) do
      @code = "VOUCHER"
      @price = 5
      @voucher = Voucher.new('Cabify Voucher',@price,@code)
      @value_discount = 1
      @two_for_one = Volument_discount.new(@value_discount,2,true)
      @cabify_pricing_rules = Pricing_rules.new
      @cabify_pricing_rules.add_rules(@code,@voucher,@two_for_one)
    end

    it 'item and discount' do
      expect(@cabify_pricing_rules.rules[@code].item).to eq(@voucher)
      expect(@cabify_pricing_rules.rules[@code].discount).to eq(@two_for_one)
    end

    it 'vars of items and discounts' do
      expect(@cabify_pricing_rules.rules[@code].item.price).to eq(@price)
      expect(@cabify_pricing_rules.rules[@code].discount.value_discount).to eq(@value_discount)
    end

    it 'methods of discounts' do
      expect(@cabify_pricing_rules.rules[@code].discount.apply_discount(@voucher,1)).to eq(5)      
    end

  end  

end