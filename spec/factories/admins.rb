FactoryGirl.define do
  factory :admin do
    sequence(:first_name)  { |n| "First_name #{n}" }
    sequence(:last_name)  { |n| "Last_name #{n}" }
    sequence(:email)  { |n| "test#{n}@example.com" }
    avatar { fixture_file_upload(Rails.root.join('spec', 'support', 'test.png'), 'image/png') }
    passport { fixture_file_upload(Rails.root.join('spec', 'support', 'test.png'), 'image/png') }
    birthday DateTime.new(2001,2,3)
    password "please1234"
  end
end
