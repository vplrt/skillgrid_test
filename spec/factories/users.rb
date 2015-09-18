FactoryGirl.define do
  factory :user do
    sequence(:email)  { |n| "test#{n}@example.com" }
    password "please123"
  end
end
