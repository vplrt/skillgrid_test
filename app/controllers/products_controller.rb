class ProductsController < ApplicationController
  before_action :find_product, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_seller!, except: [:index, :show]
  before_action :product_owner, only: [:edit, :update, :destroy]


  def index
    @products = Product.all.includes(:seller).order("created_at DESC")\
      .paginate(page: params[:page]).per_page(15)
  end

  def new
    @product = current_seller.products.build
  end

  def show
  end

  def create
    @product = current_seller.products.build(product_params)
    @product.company = current_seller.company

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

    def product_owner
      unless (@product.seller_id == current_seller.id)
        flash[:error] = "Only product owner is allowed to perform this action!"
        redirect_to root_path
      end
    end
end
