require 'rails_helper'

describe User do
  it "has a valid factory" do
    expect(build(:user)).to be_valid
  end

  before(:each) { @user = User.new(name: "Eric", email: 'user@example.com', password: "secret123") }

  subject { @user }

  it { should respond_to(:email) }
  it { is_expected.to validate_presence_of :email }
  it { is_expected.to validate_uniqueness_of(:email) }
  it { should respond_to(:name) }
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_uniqueness_of(:name) }

end
