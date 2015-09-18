module ProductsHelper
  def product_owner?
    current_seller && @product.seller_id == current_seller.id
  end
end
