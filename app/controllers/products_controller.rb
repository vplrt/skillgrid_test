class ProductsController < ApplicationController
  before_action :find_product, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @products = Product.all.includes(:user).order("created_at DESC")\
      .paginate(page: params[:page]).per_page(15)
  end

  def new
    @product = current_user.products.build
  end

  def show
  end

  def create
    @product = current_user.products.build(product_params)

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

  def destroy
    @product.destroy
    redirect_to root_path, notice: "The product has been deleted!"
  end

  private

    def product_params
      params.require(:product).permit(:title, :description, :image)
    end

    def find_product
      @product = Product.find(params[:id])
    end
end
