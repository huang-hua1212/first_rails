class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    include CartsHelper

  # 掛載在此，可以讓每個使用者都可以有cart使用
  before_action :init_cart

  private
  def init_cart
    @cart = Cart.from_hash(session[:cart9487])
  end


end
