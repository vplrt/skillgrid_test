FactoryGirl.define do
  factory :product do
    association :seller
    sequence(:title)  { |n| "Some product #{n}." }
    sequence(:description)  { |n| "Description of this great product. #{n}." }
    image { fixture_file_upload(Rails.root.join('spec', 'support', 'test.png'), \
      'image/jpg') }
  end
end
