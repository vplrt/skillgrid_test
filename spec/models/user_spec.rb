require 'rails_helper'

describe User do
  it "has a valid factory" do
    expect(build(:user)).to be_valid
  end

  it { should respond_to(:email) }
  it { is_expected.to validate_presence_of :email }
  it { is_expected.to validate_uniqueness_of(:email) }

end
