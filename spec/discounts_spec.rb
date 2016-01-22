require_relative '../discounts.rb'
require 'rspec'

RSpec.describe "Discount's class" do

  before(:each) do
    #product stock
    @voucher = Voucher.new('Cabify Voucher',5,"VOUCHER")
    @tshirt = Tshirt.new('Cabify T-Shirt',20,"TSHIRT")
    @mug = Mug.new('Cabify Coffe Mug',7.5,"MUG")
  end

  context 'has a volument discount' do

    before(:each) do
      #offerts
      @two_for_one = Volument_discount.new(1,2,true)
      @bulk_purchases = Volument_discount.new(0.95,3)
    end

    context 'in a buy 2x1 offert' do
      
      it 'with a odd number of elements' do
        expect(@two_for_one.apply_discount(@voucher,4)).to eq(@voucher.price*4/2)
      end
      
      it 'with a even number of elements' do
        expect(@two_for_one.apply_discount(@voucher,5)).to eq(@voucher.price*5-@voucher.price*2)
      end

      it 'with one element' do
        expect(@two_for_one.apply_discount(@voucher,1)).to eq(@voucher.price)
      end

    end

    context 'in a bulk purchases offert' do

      it 'below units criterial' do
        expect(@bulk_purchases.apply_discount(@tshirt,1)).to eq(@tshirt.price)
      end

      it 'over units criterial' do
        expect(@bulk_purchases.apply_discount(@tshirt,6)).to eq(@tshirt.price*0.95*6)
      end
      
      it 'equal units criterial' do
        expect(@bulk_purchases.apply_discount(@tshirt,3)).to eq(@tshirt.price*0.95*3)
      end

    end

  end

  context 'no has a discount' do

    before(:each) do
      #by default
      @no_discount = Discount.new(0)
    end
    
    it 'in a buy example' do
      expect(@no_discount.apply_discount(@mug,10)).to eq(@mug.price * 10)
    end
  end

end