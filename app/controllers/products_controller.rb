class ProductsController < ApplicationController
    before_action :find_product, only: [:edit, :show, :update, :destroy]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def show
  end

  def create
    @product = Product.new(product_params)
    if @product.save
    #   # 實體化哪家店
    #   store = Store.find_by(id: product_params[:store_id])
    #   # 哪家店總共有哪幾個商品
    #   warehouse1 = WareHouse.where(id: product_params[:store_id]) # array
    #   store.products = [...warehouse1, @product]



      # original
      redirect_to products_path, notice: "新增商品完成"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to products_path, notice: "商品更新成功"
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path, notice: "商品已刪除"
  end

  private
  def find_product
    @product = Product.find_by(id: params[:id])
    redirect_to products_path, notice: "無此商品" unless @product
  end

  def product_params
    params.require(:product).permit(:name, :description, :price,:is_available,:store_id, :quantity)
  end
end
