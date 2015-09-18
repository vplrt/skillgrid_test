require 'rails_helper'

RSpec.describe Admin, type: :model do

  it { should respond_to(:email) }
  it { is_expected.to validate_presence_of :email }
  it { is_expected.to validate_uniqueness_of(:email) }

  it { should respond_to(:first_name) }
  it { is_expected.to validate_presence_of :first_name }

  it { should respond_to(:last_name) }
  it { is_expected.to validate_presence_of :last_name }

  it { should respond_to(:birthday) }
  it { is_expected.to validate_presence_of :birthday }

  it { should respond_to(:avatar) }
  it { is_expected.to validate_presence_of :avatar }

  it { should respond_to(:passport) }
  it { is_expected.to validate_presence_of :passport }

  it { is_expected.to validate_length_of(:password).is_at_least(10) }
end
