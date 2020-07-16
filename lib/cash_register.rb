require 'pry'
class CashRegister

    attr_reader :discount 
    attr_accessor :total

   
    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
    end
    
    def add_item(title, price, quantity=1)
        self.total += (price * quantity)
        quantity.times do 
        @items << title
        @last_transaction = (price * quantity)
        end
    end

    def apply_discount
        if discount > 0
            self.total -= @total * @discount / 100
            return "After the discount, the total comes to $#{@total}."
        else 
            return "There is no discount to apply."
        end
    end

    def items
        @items
    end

    def void_last_transaction
        @total -= @last_transaction
    end

end
