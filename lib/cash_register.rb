  require 'pry'
  class CashRegister
    attr_reader :discount
    attr_accessor :items, :total, :last_transaction
    def initialize(discount=0)
        @total = 0
        @discount = discount
        @items = []
    end
    
    def add_item(title, price, quantity=1)
        # binding.pry
        price *= quantity
        self.total += price
        quantity.times do 
        items << title
        end
        self.last_transaction = price
    end
    
    def apply_discount
        if discount != 0
            self.total = total.to_i - (total.to_i*(discount.to_i))/100
            return "After the discount, the total comes to $#{self.total}."
        else 
            return "There is no discount to apply."
        end
    end
    def void_last_transaction
        self.total = self.total - self.last_transaction
    end
 
end