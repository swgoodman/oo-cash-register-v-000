
require 'pry'

class CashRegister
  @@items = []


  attr_accessor :total, :discount, :last_transaction


  def initialize(discount = nil)
    @total = 0
    @discount = discount

  end

  def discount
    @discount
  end


  def total
    @total
  end

  def last_transaction
    @last_transaction
  end


  def add_item(title, price, quantity=1)
    self.last_transaction = [price, quantity].compact.inject(:*)
    @total = self.total + self.last_transaction
    @@items << title
  end


  def apply_discount
    if @discount == nil
      return "There is no discount to apply."
    else
      @total = self.total - [self.total, @discount, 0.01 ].compact.inject(:*)
      return "After the discount, the total comes to $#{@total.to_i}."
    end
  end


  def items
    @@items
  end


  def  def void_last_transaction
    @total = @total - self.last_transaction
    @total
  end
end
