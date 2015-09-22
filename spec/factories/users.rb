FactoryGirl.define do
  factory :user do
    sequence(:email)  { |n| "test#{n}@example.ru" }
    password "please123"
  end
end
