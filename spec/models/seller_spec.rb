require 'rails_helper'

RSpec.describe Seller, type: :model do
  before(:each) { @seller = Seller.new(email: 'seller@example.com', password: "secret1234") }

  subject { @seller }

  it { should respond_to(:email) }
  it { is_expected.to validate_presence_of :email }
  it { is_expected.to validate_uniqueness_of(:email) }

  it { should respond_to(:company) }
  it { is_expected.to validate_presence_of :company }

  it { should respond_to(:avatar) }
  it { is_expected.to validate_presence_of :avatar }

  it { is_expected.to validate_length_of(:password).is_at_least(8) }

  it { should have_many(:products)}
end
