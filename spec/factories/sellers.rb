FactoryGirl.define do
  factory :seller do
    sequence(:company)  { |n| "Test company #{n}" }
    sequence(:email)  { |n| "test#{n}@example.com" }
    password "please123"
  end
end
