require "faker"

admin = Admin.new(
    first_name: "Boris",
    last_name: "Bush",
    birthday: DateTime.new(1990,1,2),
    email: "3@3.ru",
    avatar: File.new("#{Rails.root}/public/images/medium/missing.png"),
    passport: File.new("#{Rails.root}/public/images/medium/missing.png"),
    password: "1111111111",
    password_confirmation: "1111111111",
)

admin.save

puts "Created admin with id=#{admin.id}"

user = User.new(
    email: "2@2.ru",
    password: "111111",
    password_confirmation: "111111",
)

user.save

puts "Created user with id=#{user.id}"

user = User.new(
    email: "2@2.com",
    password: "111111",
    password_confirmation: "111111"
)

user.save

puts "Created user with id=#{user.id}"

seller = Seller.new(
    company: "Apple",
    email: "1@1.ru",
    avatar: File.new("#{Rails.root}/public/images/medium/missing.png"),
    password: "11111111",
    password_confirmation: "11111111",
)
seller.save

puts "Created seller with id=#{seller.id}"

4.times do
  seller = Seller.new(
    company: Faker::Company.name,
    email: Faker::Internet.email,
    avatar: File.new("#{Rails.root}/public/images/medium/missing.png"),
    password: "11111111",
    password_confirmation: "11111111",
  )
  seller.save
  puts "Created seller with id=#{seller.id}"
end

100.times do
  rand_val = rand(1..5)
  product = Product.new(
    title: Faker::Commerce.product_name,
    description: Faker::Lorem.sentence(70),
    seller_id: rand_val,
    # 1/4 of the products have no company name
    company: (rand(1..4) == 1 ? nil : Seller.find(rand_val).company),
    pro: [true, false].sample
  )
  product.save
end



