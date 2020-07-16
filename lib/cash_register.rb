require 'pry'
class CashRegister
    attr_reader :discount
    attr_accessor :total, :items, :last_transaction 

    def initialize(discount=0)
    @total=0
    @discount = discount
    @items = []
end

def add_item(title,price,quantity=1)
  cost = price *= quantity
  self.total += cost
  quantity.times do 
  @items << title
  end
@last_transaction = cost 
end 

def apply_discount
    self.total -= (self.total * @discount / 100)
    if @discount == 0
    return "There is no discount to apply."
    else 
    return  "After the discount, the total comes to $#{self.total}."
  end
end

def items
@items
end
def void_last_transaction
 self.total = self.total - @last_transaction
end


end
