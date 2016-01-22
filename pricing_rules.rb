require_relative "offerts.rb"

class Pricing_rules

  attr_accessor :rules

  def initialize
    @rules = {}
  end

  def add_rules(code,item,discount=nil)
    @rules[code] = Offert.new(item,discount)
  end

end