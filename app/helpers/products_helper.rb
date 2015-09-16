module ProductsHelper
  def product_owner?
    @product.user_id == current_user.id
  end
end
