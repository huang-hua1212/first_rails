require 'rails_helper'
# homehomehome
# homehomehome
# homehomehome
# homehomehome
# homehomehome
# homehomehome2
# homehomehome2
# homehomehome2
# homehomehome2
# homehomehome3
# homehomehome3

RSpec.describe CartItem, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it "每個 Cart Item 都可以計算它自己的金額（小計）" do
    p1 = Product.create(name:"七龍珠", price: 80)      # 建立商品 1
    p2 = Product.create(name:"冒險野郎", price: 200)   # 建立商品 2

    cart = Cart.new
    3.times { cart.add_item(p1.id, "跑步機", "", 150, true, 1) }                   # 加 3 次商品 1
    4.times { cart.add_item(p2.id, "跑步機", "", 150, true, 1) }                   # 加 4 次商品 2
    2.times { cart.add_item(p1.id, "跑步機", "", 150, true, 1) }                   # 再加 2 次商品 1

    expect(cart.items.first.price).to eq 400           # 第 1 條 cart item 的價錢應該是 400 塊
    expect(cart.items.second.price).to eq 800          # 第 2 條 cart item 應該是 800 塊
  end
  it "可以計算整台購物車的總消費金額" do 
    p1 = Product.create(name:"七龍珠", price: 80)      # 建立商品 1
    p2 = Product.create(name:"冒險野郎", price: 200)   # 建立商品 2

    cart = Cart.new
    3.times { cart.add_item(p1.id, "跑步機", "", 150, true, 1) }                   # 加 3 次商品 1
    4.times { cart.add_item(p2.id, "跑步機", "", 150, true, 1) }                   # 加 4 次商品 2
    2.times { cart.add_item(p1.id, "跑步機", "", 150, true, 1) }                   # 再加 2 次商品 1

    expect(cart.total_price).to eq 1200
  end


  describe "購物車進階功能" do
    it "可以將購物車內容轉換成 Hash，存到 Session 裡" do
      # p1 = Product.create(name:"七龍珠", price: 80)      # 建立商品 1
      # p2 = Product.create(name:"冒險野郎", price: 200)   # 建立商品 2

      cart = Cart.new
      3.times { cart.add_item(2, "跑步機", "", 150, true, 1) }                   # 加 3 次商品 1
      4.times { cart.add_item(3, "跑步機", "", 150, true, 1) }                   # 加 4 次商品 2
      # 2.times { cart.add_item(p1.id, "跑步機", "", 150, true, 1) }    

      expect(cart.serialize).to eq session_hash
    end
    it "可以把 Session 的內容（Hash 格式），還原成購物車的內容" do
      cart = Cart.from_hash(session_hash)

      expect(cart.items.first.id).to be 2
      expect(cart.items.second.id).to be 3
      expect(cart.items.first.quantity).to be 3
      expect(cart.items.second.quantity).to be 4

    end
  end

  it "特別活動可能可搭配折扣（例如聖誕節的時候全面打 9 折，或是滿額滿千送百）"


  # 測試中的變數
  # 沒有do記住
  private 
  def session_hash
    {
      "items" => [
        {"id" => 2, "quantity" => 3},
        {"id" => 3, "quantity" => 4}
      ]
    }
  end
end
