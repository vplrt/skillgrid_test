require "faker"

admin = Admin.new(
    first_name: "Boris",
    last_name: "Bush",
    birthday: DateTime.new(1990,1,2),
    email: "3@3.ru",
    password: "1111111111",
    password_confirmation: "1111111111",
)

admin.save

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
  rand_val = rand(1..5)
  product = Product.new(
    title: Faker::Commerce.product_name,
    description: Faker::Lorem.sentence(70),
    seller_id: rand_val,
    company: Seller.find(rand_val).company
  )
  product.save
end
