require "faker"

seller = Seller.new(
    company: "Apple",
    email: "1@1.ru",
    password: "11111111",
    password_confirmation: "11111111",
)
seller.save


4.times do
  seller = Seller.new(
    company: Faker::Company.name,
    email: Faker::Internet.email,
    password: "11111111",
    password_confirmation: "11111111",
  )
  seller.save
end

100.times do
  product = Product.new(
    title: Faker::Commerce.product_name,
    description: Faker::Lorem.sentence(70),
    seller_id: rand(1..5),
  )
  product.save
end
