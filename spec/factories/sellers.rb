FactoryGirl.define do
  factory :seller do
    sequence(:company)  { |n| "Test company #{n}" }
    sequence(:email)  { |n| "test#{n}@example.com" }
    password "please123"
    avatar { fixture_file_upload(Rails.root.join('spec', 'support', 'test.png'), 'image/png') }
  end
end
