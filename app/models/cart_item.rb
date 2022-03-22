# 檔案：app/models/cart_item.rb
class CartItem
    attr_reader :id, :quantity
  
    #  def initialize(id, quantity = 1)
    #   @id = id
    #   @quantity = quantity

    # end
    def initialize(id, name, description, price, is_available,store_id, quantity = 1)
      @id = id
      @quantity = quantity

      @name = name
      @description = description
      @price = price
      @is_available = is_available
      @store_id = store_id
    end
  
    def increment(n = 1)
      @quantity += n
    end
    def product
      Product.find_by(id: product_id)
    end
  end