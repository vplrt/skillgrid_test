class ProductsController < ApplicationController
  before_action :find_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all.order("created_at DESC")
  end

  def new
    @product = Product.new
  end

  def show
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to @product, notice: "The product has been successfully created."
    else
      render "new"
    end
  end

  def edit

  end

  def update
    if @product.update(product_params)
      redirect_to @product, notice: "The product has been successfully updated."
    else
      render 'edit'
    end
  end

  private

    def product_params
      params.require(:product).permit(:title, :description)
    end

    def find_product
      @product = Product.find(params[:id])
    end
end
