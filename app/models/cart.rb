# company
# company
# company
# company

# PORO MODEL
class Cart 
    # 加了一個 items 的 attr_reader，讓內、外部的取用方便一些。
    attr_reader :items



    def initialize(items = [])
        # @items = items
        @items = items
    end
    
    def add_item(id, name, description, price, is_available, store_id)
        # @items << product_id
        # 沒加小老鼠@，亦可
        found_item = items.find { |item| item.id == id }
        # found_item = @items.find { |item| item.id == id }

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

    def serialize
        # 沒加小老鼠@，亦可
        all_items = items.map{|item|
            {"id" => item.id, "quantity" => item.quantity}
        }
        # all_items = @items.map{|item|
        #     {"id" => item.id, "quantity" => item.quantity}
        # }
        {"items" => all_items}
    end
    # 類別方法
    def self.from_hash(hash)
        if hash.nil?
            # 呼叫initialize([])
            new []
        else
            # 呼叫initialize(hash["items"].map{.........})
            # 從hash的""items"屬性中，取值
            new hash["items"].map { |item_hash|
                # 假設
                CartItem.new(item_hash["id"], "跑步機", "", 150, true, 1, item_hash["quantity"])
            }
        end
    end



end
