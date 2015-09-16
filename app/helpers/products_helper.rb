module ProductsHelper
  def product_owner?
    current_user && @product.user_id == current_user.id
  end
end
