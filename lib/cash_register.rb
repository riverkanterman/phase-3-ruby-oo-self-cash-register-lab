class CashRegister
    attr_accessor :total, :discount
    attr_reader :items, :prices

    def initialize(discount=0, items=[], prices=[])
        @total = 0
        @discount = discount
        @items = items
        @prices = prices
    end

    def add_item(title, price, quantity=1)
        self.total += price*quantity
        quantity.times {self.items << title}
        self.prices << price*quantity
    end

    def apply_discount
        if self.discount != 0
            self.total -= self.total * self.discount / 100
            return "After the discount, the total comes to $#{self.total}."
        else 
            return "There is no discount to apply."
        end
    end

    def void_last_transaction
        self.total -= self.prices.last
        self.prices.pop
    end

end
