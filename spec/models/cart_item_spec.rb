require 'rails_helper'
# homehomehome
# homehomehome
# homehomehome
# homehomehome

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
  end
end
