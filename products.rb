require_relative "modules_products.rb"

class Item

  attr_reader :name, :code
  attr_accessor :price

  def initialize(name,price,code)
    @name = name
    @price = price.round(2)
    @code = code
  end

end

class Voucher < Item

  attr_reader :name, :code
  attr_accessor :price, :value

  def initialize(name,price,code,value=price)
    super(name,price,code)
    @value = value
  end

end

class Tshirt < Item

  include Design

  attr_reader :name, :code, :pattern_design
  attr_accessor :price, :size, :colour 

  def initialize(name,price,code,size="L")
    super(name,price,code)
    @size = size
  end

end

class Mug < Item

  include Design

  attr_reader :name, :code, :pattern_design
  attr_accessor :price, :colour

  def initialize(name,price,code)
    super(name,price,code)
  end

end