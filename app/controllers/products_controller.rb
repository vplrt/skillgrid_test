class ProductsController < ApplicationController
  before_action :find_product, only: [:show, :edit, :update, :destroy, :buy]
  before_action :authenticate_seller_or_admin!, except: [:index, :show, :buy]
  before_action :product_owner, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, only: [:buy]


  def index
    if can_see_pro?
      @products = Product.all.includes(:seller).order("created_at DESC")\
        .paginate(page: params[:page]).per_page(15)
    else
      @products = Product.where(pro: false).order("created_at DESC")\
        .paginate(page: params[:page]).per_page(15)
    end
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

  def buy
    if current_user.has_bad_email?
      redirect_to :back, notice: "Users with .com emails cant buy products!"
    elsif @product.can_be_sold?
      redirect_to root_path, notice: "Thank you for your purchase!"
    else
      redirect_to :back, notice: "Sorry, but you cant buy this product!"
    end
  end

  private

    def product_params
      if admin_signed_in?
        params.require(:product).permit(:title, :description, :image, :pro)
      else
        params.require(:product).permit(:title, :description, :image)
      end
    end

    def find_product
      @product = Product.find(params[:id])
    end

    def product_owner
      unless admin_signed_in? || (@product.seller_id == current_seller.id)
        redirect_to root_path, notice: "Only product owner is allowed to perform this action!"
      end
    end

    def authenticate_seller_or_admin!
      unless seller_signed_in? || admin_signed_in?
        redirect_to new_seller_session_path, notice: "Only seller is allowed to perform this action!"
      end
    end

    def can_see_pro?
      admin_signed_in? || seller_signed_in? || user_signed_in?
    end

    def bad_email

    end
end
