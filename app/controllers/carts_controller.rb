class CartsController < ApplicationController
    # 新增產品至購物車
    def add
        # # cart = Cart.from_hash(session[:cart94])
        # cart.add_item(params[:id], "跑步機", "", 150, true, 1)
        # session[:cart94] = cart.serialize
    
        # redirect_to products_path, notice: "已加入購物車"

        current_cart.add_item(params[:id], "跑步機", "", 150, true, 1)
    session[:cart9487] = current_cart.serialize

    redirect_to products_path, notice: "已加入購物車"
      end
      def show
      end
end
