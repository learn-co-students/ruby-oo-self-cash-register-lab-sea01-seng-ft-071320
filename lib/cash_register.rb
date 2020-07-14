require 'pry'

class CashRegister
  def initialize(discount=0)
    @total = 0

    @discount = discount
  end

  attr_accessor :total
  attr_reader :discount
  attr_reader :items

  def add_item(item, price, qty=1)
    @items = @items || []
    @transactions = @transactions || []

    qty.times { @items << item }
    @transactions << { item: item, price: price, qty: qty }
    
    self.total += price * qty
  end

  def apply_discount
    return "There is no discount to apply." if @discount == 0

    self.total *= (100 - @discount).to_f / 100.to_f

    "After the discount, the total comes to $#{@total.to_i}."
  end

  def void_last_transaction
    last_transaction = @transactions.last
    last_item = last_transaction[:item]
    last_price = last_transaction[:price]
    last_qty = last_transaction[:qty]

    self.total -= last_price

    last_qty.times do 
      @items.each_with_index do |item, index|
        @items.delete_at(index) if item == last_item
      end
    end

    self.total = 0.0 if @items === []
  end
end