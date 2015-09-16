require "faker"

user = User.new(
    name: "Valera",
    email: "1@1.ru",
    password: "11111111",
    password_confirmation: "11111111",
)
user.save


9.times do
  user = User.new(
    name: Faker::Internet.user_name,
    email: Faker::Internet.email,
    password: "11111111",
    password_confirmation: "11111111",
  )
  user.save
end

100.times do
  product = Product.new(
    title: Faker::Commerce.product_name,
    description: Faker::Lorem.sentence(70),
    user_id: rand(1..10),
  )
  product.save
end
