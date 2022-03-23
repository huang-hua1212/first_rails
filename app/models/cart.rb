

class Cart 
    attr_reader :items


    def initialize
        @items = []
    end
    
    def add_item(id, name, description, price, is_available, store_id)
        # @items << product_id
        found_item = items.find { |item| item.id == id }

        if found_item
          found_item.increment
        else
        #   @items << CartItem.new(id)

          @items << CartItem.new(id, name, description, price, is_available, store_id)
        end
    end
    
    def empty?
        @items.empty?
    end

    # def product
    #     Product.find_by(id: id)
    # end
    def total_price
        items.reduce(0) {|sum, item| sum+item.price}
    end
    
end
